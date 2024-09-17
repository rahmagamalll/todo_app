import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/widgets/build_show_bottom_sheet.dart';

class CustomeFloatingActionBotton extends StatelessWidget {
  const CustomeFloatingActionBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor:const Color(0xff141414),
          shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          ),
          context: context,
          builder: (context) {
            return BuildShowBottomSheet();
          },
        );
      },
      backgroundColor: kPrimaryColor,
      child: Icon(Icons.add),
    );
  }
}
