import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/cubits/add_task_cubit/add_task_cubit.dart';

class ColorItem extends StatelessWidget {
  ColorItem({super.key, required this.isActive, required this.color});
  bool isActive;
  Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Stack(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: kPrimaryColor,
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: color,
                ),
              ),
              Positioned(
                  right: 25,
                  left: 12,
                  top: 12.5,
                  child: Icon(
                    Icons.check,
                    color: kPrimaryColor,
                  )),
            ],
          )
        : CircleAvatar(
            radius: 25,
            backgroundColor: color,
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25 * 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 48),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColorsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  BlocProvider.of<AddTaskCubit>(context).color =
                      kColorsList[index].value;
                  setState(() {});
                },
                child: ColorItem(
                  color: kColorsList[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
