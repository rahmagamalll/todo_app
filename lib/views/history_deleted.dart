import 'package:flutter/material.dart';
import 'package:todo_app/widgets/history_deleted_body.dart';

class HistoryDeleted extends StatelessWidget {
  const HistoryDeleted({super.key});

  static String id = 'HistoryDeleted';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HistoryDeletedBody(),
      backgroundColor: Color(0xff141414),
    );
  }
}
