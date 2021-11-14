import 'package:flutter/material.dart' show Color, MaterialColor;

// see https://developer.gnome.org/hig/reference/palette.html
// and https://gitlab.gnome.org/GNOME/libadwaita/-/blob/main/src/stylesheet/_palette.scss
// and https://gitlab.gnome.org/Teams/Design/brand/-/blob/master/brand-book.pdf

/// The Adwaita color palette
class Colors {
  Colors._();

  static const Color blueAccent = Color(0xFF4a86cf);

  static const Color blue1 = Color(0xFF99C1F1);
  static const Color blue2 = Color(0xFF62a0ea);
  static const Color blue3 = Color(0xFF3584e4);
  static const Color blue4 = Color(0xFF1c71d8);
  static const Color blue5 = Color(0xFF1a5fb4);

  static const Color light1 = Color(0xFFffffff);
  static const Color light2 = Color(0xFFf6f5f4);
  static const Color light3 = Color(0xFFdeddda);
  static const Color light4 = Color(0xFFc0bfbc);
  static const Color light5 = Color(0xFF9a9996);

  static const Color dark1 = Color(0xFF77767b);
  static const Color dark2 = Color(0xFF5e5c64);
  static const Color dark3 = Color(0xFF3d3846);
  static const Color dark4 = Color(0xFF241f31);
  static const Color dark5 = Color(0xFF000000);

  // Defined in https://gitlab.gnome.org/GNOME/libadwaita/-/blob/main/src/stylesheet/_defaults.scss
  static const Color backgroundColor = Color(0xFFfafafa);
  static const Color darkBackgroundColor = Color(0xFF242424);

  static const Color cardBackground = Color(0xFFFFFFFF);
  //Use popover color instead of transparitize
  static const Color darkCardBackground = Color(0xFF383838);

  static const Color headerBarBackground = Color(0xFFebebeb);
  static const Color headerBarForeground = Color(0x52000000);

  static const Color darkHeaderBarBackground = Color(0xFF303030);
  static const Color darkHeaderBarForeground = Color(0xFFFFFFFF);

  static const Color red = Color(0xFFff0000);

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static MaterialColor primarySwatchColor = createMaterialColor(blueAccent);
  static MaterialColor warmGrey = createMaterialColor(light4);
}
