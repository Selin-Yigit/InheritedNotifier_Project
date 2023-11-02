import 'package:flutter/material.dart';
import 'package:inheritednotifier_project/sliderData.dart';
import 'package:inheritednotifier_project/sliderIheritedNotifier.dart';

final sliderdata = SliderData();

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
      body: SliderInheritedNotifier(
        sliderdata: sliderdata,
        child: Builder(builder: (context) {
          // Burada builder kullanılmasının sebebi, sliderın değerini "SliderInheritedNotifier" 'dan almalıyız.
          //Fakat "SliderInheritedNotifier" 'da tanımladığımız of fonksiyonu içinde kullandığımız context,
          // HomePage'e ait contextten sonra oluşturulduğu için "0.0" geliyo bu sebeple slider hareket etmiyor.
          return Column(
            children: [
              Slider(
                thumbColor: Colors.deepPurple.shade300,
                activeColor: Colors.deepPurple.shade300,
                inactiveColor: const Color.fromARGB(150, 149, 117, 205),
                value: SliderInheritedNotifier.of(context),
                onChanged: (value) {
                  sliderdata.value = value;
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Opacity(
                    opacity: SliderInheritedNotifier.of(context),
                    child: Container(
                      color: Colors.pink.shade200,
                      height: 200,
                    ),
                  ),
                  Opacity(
                    opacity: SliderInheritedNotifier.of(context),
                    child: Container(
                      color: Colors.blue.shade200,
                      height: 200,
                    ),
                  ),
                ].expandEqually().toList(),
              )
            ],
          );
        }),
      ),
    );
  }
}

extension ExpandEqually on Iterable<Widget> {
  Iterable<Widget> expandEqually() => map(
        (w) => Expanded(child: w),
      );
}
