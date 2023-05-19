import 'package:adwaita/adwaita.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

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
          themeMode: currentMode,
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.themeNotifier, Key? key}) : super(key: key);

  final ValueNotifier<ThemeMode> themeNotifier;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark mode'),
        actions: [
          SizedBox(
            height: 30,
            child: CupertinoSwitch(
              activeColor: AdwaitaColors.blue3,
              trackColor: AdwaitaColors.warmGrey,
              value: widget.themeNotifier.value != ThemeMode.light,
              onChanged: (value) {
                widget.themeNotifier.value =
                    widget.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: [
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
            child: Center(
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Title 1',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Text(
                          'Heading',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Title 2',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          'Body',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Title 3',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          'Caption Heading',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Title 4',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          'Caption',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ]
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(12),
                          child: e,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
