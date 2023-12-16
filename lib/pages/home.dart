import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twaiv_test/pages/blocs/basket/baskets_bloc.dart';
import 'package:twaiv_test/pages/blocs/trays/trays_bloc.dart';
import 'package:twaiv_test/pages/bottom_basket.dart';
import 'package:twaiv_test/pages/trays_success_list.dart';
import 'package:twaiv_test/theme/spacing.dart';
import 'package:twaiv_test/widgets/app_bar.dart';
import 'package:twaiv_test/widgets/search_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppBarHeader()),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TraysBloc()),
          BlocProvider(create: (context) => BasketsBloc()),
        ],
        child: const Column(
          children: [
            SizedBox(height: TwaivSpacing.small),
            SearchBox(),
            Expanded(
              child: Stack(
                children: [
                  TraysSuccessList(),
                  BottomBasketsBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
