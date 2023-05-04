import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Notes App"),
      ),
      body: Center(
        child: Lottie.asset("assets/lottie/notebook.json", repeat: false),
      ),
    );
  }
}
