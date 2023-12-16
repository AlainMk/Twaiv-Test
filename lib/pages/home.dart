import 'package:flutter/material.dart';
import 'package:twaiv_test/data/api/fake_data.dart';
import 'package:twaiv_test/data/model/tray.dart';
import 'package:twaiv_test/pages/tray_item.dart';
import 'package:twaiv_test/theme/spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trays = Tray.fromJsonList(fakeTrays);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return TrayItem(tray: trays[index]);
        },
        itemCount: trays.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: TwaivSpacing.large);
        },
      ),
    );
  }
}
