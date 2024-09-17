import 'package:flutter/material.dart';
import 'package:todo_app/widgets/custom_floating_action_button.dart';
import 'package:todo_app/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff141414),
      body: HomeViewBody(),
      floatingActionButton: CustomeFloatingActionBotton(),
    );
  }
}
