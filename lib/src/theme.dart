import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:adwaita/src/utils/colors.dart';

class AdwaitaThemeData {
  const AdwaitaThemeData._();

  static final _lightColorScheme = ColorScheme.fromSwatch(
    // NOTE(robert-ancell): Light shades from 'Tint' on website, dark shades calculated.
    primarySwatch: AdwaitaColors.primarySwatchColor,
    primaryColorDark: AdwaitaColors.darkBackgroundColor,
    accentColor: AdwaitaColors.blueAccent,
    cardColor: AdwaitaColors.cardBackground,
    backgroundColor: AdwaitaColors.backgroundColor,
    errorColor: AdwaitaColors.red,
    brightness: Brightness.light,
  );

  static final _darkColorScheme = ColorScheme.fromSwatch(
    // NOTE(robert-ancell): Light shades from 'Tint' on website, dark shades calculated.
    primarySwatch: AdwaitaColors.primarySwatchColor,
    primaryColorDark: AdwaitaColors.darkBackgroundColor,
    accentColor: AdwaitaColors.blueAccent,
    cardColor: AdwaitaColors.darkCardBackground,
    backgroundColor: AdwaitaColors.darkBackgroundColor,
    errorColor: AdwaitaColors.red,
    brightness: Brightness.dark,
  );

  static ThemeData light() => ThemeData(
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
          backgroundColor: AdwaitaColors.blueAccent,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: _lightColorScheme.primary,
          unselectedItemColor: AdwaitaColors.dark3,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AdwaitaColors.button,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              width: 1.0,
              style: BorderStyle.solid,
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              width: 1.0,
              style: BorderStyle.solid,
              color: AdwaitaColors.blueAccent,
            ),
          ),
        ),
      );

  static ThemeData dark() => ThemeData(
        tabBarTheme: TabBarTheme(labelColor: _darkColorScheme.onBackground),
        dialogTheme: DialogTheme(
          backgroundColor: AdwaitaColors.dark3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ),
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
        primaryColorDark: AdwaitaColors.blueAccent,
        appBarTheme: _appBarDarkTheme,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AdwaitaColors.blueAccent,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: _darkColorScheme.primary,
          unselectedItemColor: AdwaitaColors.warmGrey.shade300,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AdwaitaColors.darkButton,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              width: 1.0,
              style: BorderStyle.solid,
              color: Colors.transparent,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              width: 1.0,
              style: BorderStyle.solid,
              color: AdwaitaColors.blueAccent,
            ),
          ),
        ),
      );

// Special casing some widgets to get the desired Adwaita look
// Buttons

  static final _commonButtonStyle = ButtonStyle(
    visualDensity: VisualDensity.standard,
    backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
      if (states.contains(MaterialState.pressed)) {
        return AdwaitaColors.light4;
      }
      return AdwaitaColors.light2; // Use the component's default.
    }),
  );

  static final _darkCommonButtonStyle = ButtonStyle(
    visualDensity: VisualDensity.standard,
    backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
      if (states.contains(MaterialState.pressed)) {
        return AdwaitaColors.dark5;
      }
      return AdwaitaColors.dark2; // Use the component's default.
    }),
  );

  static final _buttonThemeData = ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );

  static final _outlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      visualDensity: _commonButtonStyle.visualDensity,
      primary: AdwaitaColors.dark4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    ),
  );

  static final _darkOutlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      visualDensity: _commonButtonStyle.visualDensity,
      primary: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        side: BorderSide(color: Colors.black.withOpacity(0.75)),
      ),
    ),
  );

  static final _textButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      visualDensity: _commonButtonStyle.visualDensity,
      backgroundColor: AdwaitaColors.button,
      primary: AdwaitaColors.dark4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: Colors.transparent),
      ),
    ),
  );

  static final _darkTextButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      visualDensity: _darkCommonButtonStyle.visualDensity,
      backgroundColor: AdwaitaColors.darkButton,
      primary: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: Colors.transparent),
      ),
    ),
  );

  static ElevatedButtonThemeData _getElevatedButtonThemeData(
    Brightness brightness,
  ) {
    if (brightness == Brightness.light) {
      return ElevatedButtonThemeData(style: _commonButtonStyle);
    }
    return ElevatedButtonThemeData(style: _darkCommonButtonStyle);
  }

// Switches
  static Color _getSwitchThumbColorDark(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return AdwaitaColors.dark2;
    } else {
      if (states.contains(MaterialState.selected)) {
        return AdwaitaColors.blueAccent;
      } else {
        return AdwaitaColors.warmGrey;
      }
    }
  }

  static Color _getSwitchTrackColorDark(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return AdwaitaColors.dark2.withAlpha(120);
    } else {
      if (states.contains(MaterialState.selected)) {
        return AdwaitaColors.blueAccent.withAlpha(160);
      } else {
        return AdwaitaColors.warmGrey.withAlpha(80);
      }
    }
  }

  static final _switchStyleDark = SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith(_getSwitchThumbColorDark),
    trackColor: MaterialStateProperty.resolveWith(_getSwitchTrackColorDark),
  );

  static Color _getSwitchThumbColorLight(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return AdwaitaColors.warmGrey.shade200;
    } else {
      if (states.contains(MaterialState.selected)) {
        return AdwaitaColors.blueAccent;
      } else {
        return Colors.white;
      }
    }
  }

  static Color _getSwitchTrackColorLight(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return AdwaitaColors.warmGrey.shade200;
    } else {
      if (states.contains(MaterialState.selected)) {
        return AdwaitaColors.blueAccent.withAlpha(180);
      } else {
        return AdwaitaColors.warmGrey.shade300;
      }
    }
  }

  static final _switchStyleLight = SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith(_getSwitchThumbColorLight),
    trackColor: MaterialStateProperty.resolveWith(_getSwitchTrackColorLight),
  );

// Checks
  static Color _getCheckFillColorDark(Set<MaterialState> states) {
    if (!states.contains(MaterialState.disabled)) {
      if (states.contains(MaterialState.selected)) {
        return AdwaitaColors.blueAccent;
      }
      return AdwaitaColors.warmGrey.shade400;
    }
    return AdwaitaColors.warmGrey.withOpacity(0.4);
  }

  static Color _getCheckColorDark(Set<MaterialState> states) {
    if (!states.contains(MaterialState.disabled)) {
      return Colors.white;
    }
    return AdwaitaColors.warmGrey;
  }

  static final _checkStyleDark = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2),
    ),
    fillColor: MaterialStateProperty.resolveWith(_getCheckFillColorDark),
    checkColor: MaterialStateProperty.resolveWith(_getCheckColorDark),
  );

  static Color _getCheckFillColorLight(Set<MaterialState> states) {
    if (!states.contains(MaterialState.disabled)) {
      if (states.contains(MaterialState.selected)) {
        return AdwaitaColors.blueAccent;
      }
      return AdwaitaColors.warmGrey;
    }
    return AdwaitaColors.warmGrey.shade300;
  }

  static Color _getCheckColorLight(Set<MaterialState> states) {
    if (!states.contains(MaterialState.disabled)) {
      return Colors.white;
    }
    return AdwaitaColors.warmGrey;
  }

  static final _checkStyleLight = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2),
    ),
    fillColor: MaterialStateProperty.resolveWith(_getCheckFillColorLight),
    checkColor: MaterialStateProperty.resolveWith(_getCheckColorLight),
  );

// Radios
  static final _radioStyleDark = RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith(_getCheckFillColorDark),
  );

  static final _radioStyleLight = RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith(_getCheckFillColorLight),
  );

  static final _appBarLightTheme = const AppBarTheme(
    elevation: 1.0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: AdwaitaColors.headerBarBackground,
    foregroundColor: AdwaitaColors.headerBarForeground,
    iconTheme: IconThemeData(color: AdwaitaColors.dark3),
    actionsIconTheme: IconThemeData(color: AdwaitaColors.dark3),
  );

  static final _appBarDarkTheme = const AppBarTheme(
    elevation: 1.0,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: AdwaitaColors.darkHeaderBarBackground,
    foregroundColor: AdwaitaColors.darkHeaderBarForeground,
  );
}
