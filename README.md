<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Implementation of the adwaita color scheme found in [libadwaita](https://gitlab.gnome.org/GNOME/libadwaita).

Inspired by the [yaru theme](https://github.com/ubuntu/yaru.dart) for flutter.


## Usage

```dart
import 'package:flutter/material.dart';
import 'package:adwaita/adwaita.dart' as adwaita;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
              theme: adwaita.lightTheme,
              darkTheme: adwaita.darkTheme,
              debugShowCheckedModeBanner: false,
              home: MyHomePage(themeNotifier: themeNotifier),
              themeMode: currentMode);
        });
  }
}
```
