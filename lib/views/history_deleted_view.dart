import 'package:flutter/material.dart';
import 'package:todo_app/widgets/history_deleted_body.dart';

class HistoryDeletedView extends StatelessWidget {
  const HistoryDeletedView({super.key});

  static String id = 'HistoryDeletedView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HistoryDeletedViewBody(),
      backgroundColor: Color(0xff141414),
    );
  }
}
