import 'package:flutter/material.dart';
import 'package:twaiv_test/data/api/tray/fake_data.dart';
import 'package:twaiv_test/data/model/tray.dart';
import 'package:twaiv_test/pages/bottom_basket.dart';
import 'package:twaiv_test/pages/tray_item.dart';
import 'package:twaiv_test/theme/spacing.dart';
import 'package:twaiv_test/widgets/app_bar.dart';
import 'package:twaiv_test/widgets/search_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trays = Tray.fromJsonList(fakeTrays);
    return Scaffold(
      appBar: AppBar(title: const AppBarHeader()),
      body: Column(
        children: [
          const SizedBox(height: TwaivSpacing.small),
          const SearchBox(),
          Expanded(
            child: Stack(
              children: [
                ListView.separated(
                  padding: const EdgeInsets.only(
                    top: TwaivSpacing.large,
                    bottom: TwaivSpacing.largeXxxl * 4,
                  ),
                  itemBuilder: (context, index) {
                    return TrayItem(tray: trays[index]);
                  },
                  itemCount: trays.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: TwaivSpacing.large);
                  },
                ),
                const BottomBasketsBar()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
