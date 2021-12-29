import 'package:flutter/material.dart';
import 'package:adwaita/adwaita.dart';

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
              theme: AdwaitaThemeData.light(),
              darkTheme: AdwaitaThemeData.dark(),
              debugShowCheckedModeBanner: false,
              home: MyHomePage(themeNotifier: themeNotifier),
              themeMode: currentMode);
        });
  }
}

class MyHomePage extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const MyHomePage({Key? key, required this.themeNotifier}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Column(
            children: [
              SwitchListTile(
                  title: Text(
                    "Dark mode",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  value: widget.themeNotifier.value == ThemeMode.light
                      ? false
                      : true,
                  onChanged: (value) {
                    widget.themeNotifier.value =
                        widget.themeNotifier.value == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light;
                  }),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('The Enchanted Nightingale'),
                      subtitle:
                          Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('BUY TICKETS'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('LISTEN'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You have pushed the add button this many times:'),
                Text('$_counter', style: Theme.of(context).textTheme.headline4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
