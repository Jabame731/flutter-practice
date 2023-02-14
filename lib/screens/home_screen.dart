import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:qoutesapp/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = '';
  String author = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                quote,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "- $author",
                    style: TextStyle(fontSize: 18),
                  )),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = Uri.parse('https://dummyjson.com/quotes');
                var response = await http.get(url);
                print('Response status: ${response.statusCode}');
                print('Response body: ${response.body}');
                var data = jsonDecode(response.body);

                quote = data["quotes"][1]["quote"];
                author = data["quotes"][1]["author"];

                setState(() {});

                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => Second_Screen(
                //           quoteText: quote,
                //           authorName: author,
                //         )));
              },
              child: Text('Get Qoute'),
            ),
          ],
        ),
      ),
    );
  }
}
