import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twaiv_test/data/api/basket/fake_data.dart';
import 'package:twaiv_test/data/model/DnDRaw.dart';
import 'package:twaiv_test/data/model/basket.dart';
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
                for (var i = 0; i < fakeBaskets.length; i++)
                  _buildItemCart(i, context),
              ],
            ),
            const SizedBox(height: TwaivSpacing.large),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCart(int i, BuildContext context) {
    final baskets = Basket.fromJsonList(fakeBaskets);
    return Expanded(
      child: DragTarget<DnDRaw>(
        onAccept: (raw) {
          debugPrint('receive fruit ${raw.fruit.name}');
        },
        builder: (BuildContext context, List<DnDRaw?> candidateData,
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
                  baskets[i].name,
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
                      '${baskets[i].fruits.length}',
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
