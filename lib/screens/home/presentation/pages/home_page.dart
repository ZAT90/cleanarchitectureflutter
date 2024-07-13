import 'package:cleanarchitectureflutter/core/constants/navigation_constants.dart';
import 'package:cleanarchitectureflutter/core/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: UiConstants(context).screenHeight,
        width: UiConstants(context).screenWidth,
        child: Column(
          children: [
            const Text('this is home'),
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, NavigationConstants.comment),
                child: Text('go to comment'))
          ],
        ),
      ),
    );
  }
}
