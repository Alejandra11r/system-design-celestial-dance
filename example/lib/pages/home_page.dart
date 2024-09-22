import 'package:flutter/material.dart';
import 'package:system_design_celestial_dance/components/molecules/index.dart';
import 'package:system_design_celestial_dance/components/pages/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPage(
        title: 'Celestial Dance',
        showBack: false,
        body: Column(
          children: [
            CustomCard(
              title: 'Átomos',
              onTap: () => Navigator.pushNamed(context, 'atomsPage'),
            ),
            CustomCard(
              title: 'Moleculas',
              onTap: () => Navigator.pushNamed(context, 'moleculesPage'),
            ),
            CustomCard(
              title: 'Organismos',
              onTap: () => Navigator.pushNamed(context, 'organismsPage'),
            ),
          ],
        ));
  }
}
