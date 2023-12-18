import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twaiv_test/data/model/dnd_raw.dart';
import 'package:twaiv_test/pages/blocs/basket/baskets_bloc.dart';
import 'package:twaiv_test/pages/blocs/trays/trays_bloc.dart';
import 'package:twaiv_test/theme/border_radius.dart';
import 'package:twaiv_test/theme/spacing.dart';

class BottomBasketsBar extends StatelessWidget {
  const BottomBasketsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TwaivSpacing.zero,
      left: TwaivSpacing.zero,
      right: TwaivSpacing.zero,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: TwaivSpacing.large,
          vertical: TwaivSpacing.normal + TwaivSpacing.none,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(TwaivBorderRadius.big),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Drop your choice here',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: TwaivSpacing.normal),
            BlocBuilder<BasketsBloc, BasketsState>(
              builder: (context, state) {
                return Row(
                  children: [
                    for (var i = 0; i < state.baskets.length; i++)
                      _buildItemCart(i, context),
                  ],
                );
              },
            ),
            const SizedBox(height: TwaivSpacing.large),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCart(int i, BuildContext context) {
    return Expanded(
      child: BlocBuilder<BasketsBloc, BasketsState>(
        builder: (context, state) {
          final basket = state.baskets[i];
          return DragTarget<DnDRaw>(
            onAccept: (raw) {
              final fruit = raw.fruit;
              final fromTray = raw.tray;

              context
                  .read<TraysBloc>()
                  .add(RemoveFruit(trayId: fromTray.name, fruitId: fruit.id));
              context
                  .read<BasketsBloc>()
                  .add(AddFruitToBasket(fruit: fruit, basketId: basket.id));
            },
            builder: (BuildContext context, List<DnDRaw?> candidateData,
                List<dynamic> rejectedData) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: TwaivSpacing.medium),
                margin: EdgeInsets.only(
                  right: i != 2 ? TwaivSpacing.medium : TwaivSpacing.zero,
                ),
                decoration: BoxDecoration(
                  color: basket.fruits.isEmpty
                      ? Colors.grey.shade200
                      : Theme.of(context).primaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(TwaivBorderRadius.big),
                ),
                child: Column(
                  children: [
                    Text(
                      basket.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 12),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: TwaivSpacing.smallMedium),
                      alignment: Alignment.center,
                      child: Badge(
                        badgeContent: Text(
                          '${basket.fruits.length}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white),
                        ),
                        position: BadgePosition.topEnd(end: -6),
                        child: const Icon(CupertinoIcons.cart),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
