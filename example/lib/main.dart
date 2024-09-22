import 'package:example/pages/atoms_page.dart';
import 'package:example/pages/home_page.dart';
import 'package:example/pages/molecules_page.dart';
import 'package:example/pages/organisms_page.dart';
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
      title: 'Celestial Dance',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        'atomsPage': (context) => const AtomsPage(),
        'moleculesPage': (context) => const MoleculesPage(),
        'organismsPage': (context) => const OrganismsPage(),
      },
      home: const HomePage(),
    );
  }
}
