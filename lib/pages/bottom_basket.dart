import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twaiv_test/data/model/fruit.dart';
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
            Row(
              children: [
                for (var i = 0; i < 3; i++) _buildItemCart(i, context),
              ],
            ),
            const SizedBox(height: TwaivSpacing.large),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCart(int i, BuildContext context) {
    return Expanded(
      child: DragTarget<Fruit>(
        onAccept: (fruit) {
          debugPrint('receive fruit ${fruit.name}');
        },
        builder: (BuildContext context, List<Fruit?> candidateData,
            List<dynamic> rejectedData) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: TwaivSpacing.medium),
            margin: EdgeInsets.only(
              right: i != 2 ? TwaivSpacing.medium : TwaivSpacing.zero,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(TwaivBorderRadius.big),
            ),
            child: Column(
              children: [
                Text(
                  'Basket One',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 12),
                ),
                Container(
                  margin: const EdgeInsets.only(top: TwaivSpacing.smallMedium),
                  alignment: Alignment.center,
                  child: Badge(
                    label: Text(
                      '0',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                    alignment: Alignment.topRight,
                    offset: const Offset(10, -5),
                    child: const Icon(CupertinoIcons.cart),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
