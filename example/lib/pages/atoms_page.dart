import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:system_design_celestial_dance/components/pages/index.dart';
import 'package:system_design_celestial_dance/components/atoms/index.dart';

class AtomsPage extends StatelessWidget {
  const AtomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return CustomPage(
        title: 'Átomos',
        showBack: true,
        body: Column(
          children: [
            CustomInput(
              controller: controller,
              nameLabel: 'prueba',
            ),
            
          ],
        ));
  }
}
