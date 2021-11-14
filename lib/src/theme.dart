import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:adwaita/src/utils/colors.dart' as adwaita;

final _lightColorScheme = ColorScheme.fromSwatch(
  // NOTE(robert-ancell): Light shades from 'Tint' on website, dark shades calculated.
  primarySwatch: adwaita.Colors.primarySwatchColor,
  primaryColorDark: adwaita.Colors.darkBackgroundColor,
  accentColor: adwaita.Colors.blueAccent,
  cardColor: adwaita.Colors.cardBackground,
  backgroundColor: adwaita.Colors.backgroundColor,
  errorColor: adwaita.Colors.red,
  brightness: Brightness.light,
);

final _darkColorScheme = ColorScheme.fromSwatch(
  // NOTE(robert-ancell): Light shades from 'Tint' on website, dark shades calculated.
  primarySwatch: adwaita.Colors.primarySwatchColor,
  primaryColorDark: adwaita.Colors.darkBackgroundColor,
  accentColor: adwaita.Colors.blueAccent,
  cardColor: adwaita.Colors.darkCardBackground,
  backgroundColor: adwaita.Colors.darkBackgroundColor,
  errorColor: adwaita.Colors.red,
  brightness: Brightness.dark,
);

final lightTheme = ThemeData(
    tabBarTheme: TabBarTheme(labelColor: _lightColorScheme.onSurface),
    brightness: Brightness.light,
    primaryColor: _lightColorScheme.primary,
    primaryColorBrightness:
        ThemeData.estimateBrightnessForColor(_lightColorScheme.primary),
    canvasColor: _lightColorScheme.background,
    scaffoldBackgroundColor: _lightColorScheme.background,
    bottomAppBarColor: _lightColorScheme.surface,
    cardColor: _lightColorScheme.surface,
    dividerColor: _lightColorScheme.onSurface.withOpacity(0.12),
    backgroundColor: _lightColorScheme.background,
    dialogBackgroundColor: _lightColorScheme.background,
    errorColor: _lightColorScheme.error,
    // textTheme: _textTheme,
    indicatorColor: _lightColorScheme.secondary,
    applyElevationOverlayColor: false,
    colorScheme: _lightColorScheme,
    buttonTheme: _buttonThemeData,
    elevatedButtonTheme: _getElevatedButtonThemeData(Brightness.light),
    outlinedButtonTheme: _outlinedButtonThemeData,
    textButtonTheme: _textButtonThemeData,
    switchTheme: _switchStyleLight,
    checkboxTheme: _checkStyleLight,
    radioTheme: _radioStyleLight,
    appBarTheme: _appBarLightTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: adwaita.Colors.blueAccent,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: _lightColorScheme.primary,
      unselectedItemColor: adwaita.Colors.dark3,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ));

final darkTheme = ThemeData(
  tabBarTheme: TabBarTheme(labelColor: _darkColorScheme.onBackground),
  dialogTheme: DialogTheme(
      backgroundColor: adwaita.Colors.dark3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(color: Colors.white.withOpacity(0.2)))),
  brightness: Brightness.dark,
  primaryColor: _darkColorScheme.primary,
  primaryColorBrightness:
      ThemeData.estimateBrightnessForColor(_darkColorScheme.primary),
  canvasColor: _darkColorScheme.background,
  scaffoldBackgroundColor: _darkColorScheme.background,
  bottomAppBarColor: _darkColorScheme.surface,
  cardColor: _darkColorScheme.surface,
  dividerColor: _darkColorScheme.onSurface.withOpacity(0.12),
  backgroundColor: _darkColorScheme.background,
  dialogBackgroundColor: _darkColorScheme.background,
  errorColor: _darkColorScheme.error,
  // textTheme: _textTheme,
  indicatorColor: _darkColorScheme.secondary,
  applyElevationOverlayColor: true,
  colorScheme: _darkColorScheme,
  buttonTheme: _buttonThemeData,
  textButtonTheme: _darkTextButtonThemeData,
  elevatedButtonTheme: _getElevatedButtonThemeData(Brightness.dark),
  outlinedButtonTheme: _darkOutlinedButtonThemeData,
  switchTheme: _switchStyleDark,
  checkboxTheme: _checkStyleDark,
  radioTheme: _radioStyleDark,
  primaryColorDark: adwaita.Colors.blueAccent,
  appBarTheme: _appBarDarkTheme,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: adwaita.Colors.blueAccent,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: _darkColorScheme.primary,
    unselectedItemColor: adwaita.Colors.warmGrey.shade300,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
  ),
);

// Special casing some widgets to get the desired Adwaita look
// Buttons

var _commonButtonStyle = ButtonStyle(
    visualDensity: VisualDensity.standard,
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return adwaita.Colors.light4;
        }
        return adwaita.Colors.light2; // Use the component's default.
      },
    ));

var _darkCommonButtonStyle = ButtonStyle(
    visualDensity: VisualDensity.standard,
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return adwaita.Colors.dark5;
        }
        return adwaita.Colors.dark2; // Use the component's default.
      },
    ));

final _buttonThemeData = ButtonThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4.0),
  ),
);

final _outlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        visualDensity: _commonButtonStyle.visualDensity,
        primary: adwaita.Colors.dark4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        )));

final _darkOutlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        visualDensity: _commonButtonStyle.visualDensity,
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          side: BorderSide(color: Colors.black.withOpacity(0.75)),
        )));

final _textButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
        visualDensity: _commonButtonStyle.visualDensity,
        primary: Colors.black));

final _darkTextButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
        visualDensity: _darkCommonButtonStyle.visualDensity));

ElevatedButtonThemeData _getElevatedButtonThemeData(Brightness brightness) {
  if (brightness == Brightness.light) {
    return ElevatedButtonThemeData(style: _commonButtonStyle);
  }
  return ElevatedButtonThemeData(style: _darkCommonButtonStyle);
}

// Switches
Color _getSwitchThumbColorDark(Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return adwaita.Colors.dark2;
  } else {
    if (states.contains(MaterialState.selected)) {
      return adwaita.Colors.blueAccent;
    } else {
      return adwaita.Colors.warmGrey;
    }
  }
}

Color _getSwitchTrackColorDark(Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return adwaita.Colors.dark2.withAlpha(120);
  } else {
    if (states.contains(MaterialState.selected)) {
      return adwaita.Colors.blueAccent.withAlpha(160);
    } else {
      return adwaita.Colors.warmGrey.withAlpha(80);
    }
  }
}

final _switchStyleDark = SwitchThemeData(
  thumbColor: MaterialStateProperty.resolveWith(_getSwitchThumbColorDark),
  trackColor: MaterialStateProperty.resolveWith(_getSwitchTrackColorDark),
);

Color _getSwitchThumbColorLight(Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return adwaita.Colors.warmGrey.shade200;
  } else {
    if (states.contains(MaterialState.selected)) {
      return adwaita.Colors.blueAccent;
    } else {
      return Colors.white;
    }
  }
}

Color _getSwitchTrackColorLight(Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return adwaita.Colors.warmGrey.shade200;
  } else {
    if (states.contains(MaterialState.selected)) {
      return adwaita.Colors.blueAccent.withAlpha(180);
    } else {
      return adwaita.Colors.warmGrey.shade300;
    }
  }
}

final _switchStyleLight = SwitchThemeData(
  thumbColor: MaterialStateProperty.resolveWith(_getSwitchThumbColorLight),
  trackColor: MaterialStateProperty.resolveWith(_getSwitchTrackColorLight),
);

// Checks
Color _getCheckFillColorDark(Set<MaterialState> states) {
  if (!states.contains(MaterialState.disabled)) {
    if (states.contains(MaterialState.selected)) {
      return adwaita.Colors.blueAccent;
    }
    return adwaita.Colors.warmGrey.shade400;
  }
  return adwaita.Colors.warmGrey.withOpacity(0.4);
}

Color _getCheckColorDark(Set<MaterialState> states) {
  if (!states.contains(MaterialState.disabled)) {
    return Colors.white;
  }
  return adwaita.Colors.warmGrey;
}

final _checkStyleDark = CheckboxThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(2),
  ),
  fillColor: MaterialStateProperty.resolveWith(_getCheckFillColorDark),
  checkColor: MaterialStateProperty.resolveWith(_getCheckColorDark),
);

Color _getCheckFillColorLight(Set<MaterialState> states) {
  if (!states.contains(MaterialState.disabled)) {
    if (states.contains(MaterialState.selected)) {
      return adwaita.Colors.blueAccent;
    }
    return adwaita.Colors.warmGrey;
  }
  return adwaita.Colors.warmGrey.shade300;
}

Color _getCheckColorLight(Set<MaterialState> states) {
  if (!states.contains(MaterialState.disabled)) {
    return Colors.white;
  }
  return adwaita.Colors.warmGrey;
}

final _checkStyleLight = CheckboxThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(2),
  ),
  fillColor: MaterialStateProperty.resolveWith(_getCheckFillColorLight),
  checkColor: MaterialStateProperty.resolveWith(_getCheckColorLight),
);

// Radios
final _radioStyleDark = RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith(_getCheckFillColorDark));

final _radioStyleLight = RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith(_getCheckFillColorLight));

var _appBarLightTheme = const AppBarTheme(
  elevation: 1.0,
  systemOverlayStyle: SystemUiOverlayStyle.light,
  backgroundColor: adwaita.Colors.headerBarBackground,
  foregroundColor: adwaita.Colors.headerBarForeground,
  iconTheme: IconThemeData(color: adwaita.Colors.dark3),
  actionsIconTheme: IconThemeData(color: adwaita.Colors.dark3),
);

var _appBarDarkTheme = const AppBarTheme(
  elevation: 1.0,
  systemOverlayStyle: SystemUiOverlayStyle.dark,
  backgroundColor: adwaita.Colors.darkHeaderBarBackground,
  foregroundColor: adwaita.Colors.darkHeaderBarForeground,
);
