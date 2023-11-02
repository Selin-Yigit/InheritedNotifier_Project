import 'package:flutter/material.dart';
import 'package:inheritednotifier_project/sliderData.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        centerTitle: true,
        title: const Text(
          "Inherited Notifier Project",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Slider(
            thumbColor: Colors.deepPurple.shade300,
            activeColor: Colors.deepPurple.shade300,
            inactiveColor: const Color.fromARGB(150, 149, 117, 205),
            value: 0.0,
            onChanged: (value) {},
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                color: Colors.pink.shade200,
                height: 200,
              ),
              Container(
                color: Colors.blue.shade200,
                height: 200,
              ),
            ].expandEqually().toList(),
          )
        ],
      ),
    );
  }
}

extension ExpandEqually on Iterable<Widget> {
  Iterable<Widget> expandEqually() => map(
        (w) => Expanded(child: w),
      );
}
