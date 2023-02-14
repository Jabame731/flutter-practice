import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Second_Screen extends StatelessWidget {
  String quoteText;
  String authorName;

  Second_Screen({super.key, required this.authorName, required this.quoteText});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(children: []),
      ),
    );
  }
}
