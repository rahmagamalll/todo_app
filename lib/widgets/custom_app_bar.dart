import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.name, this.icon, this.onPressed});
  final String? name;
  final IconData? icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 12),
      child: Row(
        children: [
          Text(
            name!.substring(0, 2),
            style:const TextStyle(fontSize: 30),
          ),
          Text(
            name!.substring(2, name!.length),
            style: TextStyle(fontSize: 35, color: kPrimaryColor),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16)),
            child: IconButton(
              icon: Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
              onPressed: onPressed,
            ),
          )
        ],
      ),
    );
  }
}
