import 'package:example/theme/custom_color_scheme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: ThemeData.light().copyWith(extensions: [
        const CustomColorScheme().light(),
      ]),
      darkTheme: ThemeData.dark().copyWith(extensions: [
        const CustomColorScheme().dark(),
      ]),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final customColorScheme = const CustomColorScheme().provider(context);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              color: customColorScheme.background,
              padding: const EdgeInsets.all(18),
              child: Text(
                'Custom Themer test',
                style: TextStyle(color: customColorScheme.foreground),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
