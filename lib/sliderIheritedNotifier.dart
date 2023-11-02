import 'package:flutter/material.dart';
import 'package:inheritednotifier_project/sliderData.dart';

class SliderInheritedNotifier extends InheritedNotifier<SliderData> {
  // inheritde notifier, change notifier'daki değer değişikliklerini dinleyerek widget'ları rebuilt eder.

  const SliderInheritedNotifier({
    Key? key,
    required Widget child,
    required SliderData sliderdata,
  }) : super(
          key: key,
          child: child,
          notifier: sliderdata,
        );

  static double of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<SliderInheritedNotifier>()
            ?.notifier
            ?.value ??
        0.0;
  }
}
