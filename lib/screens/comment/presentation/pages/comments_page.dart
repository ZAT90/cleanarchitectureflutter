import 'package:cleanarchitectureflutter/core/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    body: SizedBox(
      width: UiConstants(context).screenWidth,
      height: UiConstants(context).screenHeight,
      child: Text('comments page load'),
    ),);
  }
}