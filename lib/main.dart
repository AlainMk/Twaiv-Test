import 'package:flutter/material.dart';
import 'package:twaiv_test/data/di.dart';
import 'package:twaiv_test/pages/home.dart';
import 'package:twaiv_test/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjector.inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twaiv Demo',
      theme: TwaivTheme.light(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
