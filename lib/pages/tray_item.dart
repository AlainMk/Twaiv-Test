import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twaiv_test/data/model/DnDRaw.dart';
import 'package:twaiv_test/data/model/fruit.dart';
import 'package:twaiv_test/data/model/tray.dart';
import 'package:twaiv_test/pages/blocs/trays/trays_bloc.dart';
import 'package:twaiv_test/theme/border_radius.dart';
import 'package:twaiv_test/theme/colors.dart';
import 'package:twaiv_test/theme/images.dart';
import 'package:twaiv_test/theme/spacing.dart';

class TrayItem extends StatelessWidget {
  const TrayItem({super.key, required this.tray});
  final Tray tray;

  @override
  Widget build(BuildContext context) {
    return DragTarget<DnDRaw>(
      hitTestBehavior: HitTestBehavior.opaque,
      onAccept: (raw) {
        final fruit = raw.fruit;
        final fromTray = raw.tray;
        final exist = tray.fruits.where((f) => fruit.id == f.id);

        if (exist.isNotEmpty) return;

        context
            .read<TraysBloc>()
            .add(RemoveFruit(trayId: fromTray.name, fruitId: fruit.id));
        context
            .read<TraysBloc>()
            .add(AddFruit(fruit: fruit, trayId: tray.name));
      },
      builder: (BuildContext context, List<DnDRaw?> candidateData,
          List<dynamic> rejectedData) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: TwaivSpacing.large),
          padding: const EdgeInsets.all(TwaivSpacing.large),
          decoration: BoxDecoration(
            color: TwaivColors.white,
            borderRadius: BorderRadius.circular(TwaivBorderRadius.big),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    TwaivImages.badgeIcon,
                    width: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: TwaivSpacing.small),
                  Expanded(
                    child: Text(
                      tray.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      borderRadius:
                          BorderRadius.circular(TwaivBorderRadius.normal),
                    ),
                    child: const Icon(Icons.arrow_forward),
                  )
                ],
              ),
              const SizedBox(height: TwaivSpacing.none),
              Text(
                'Everything for you to stay healthy',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: TwaivSpacing.largeL),
              tray.fruits.isEmpty
                  ? _buildEmptyList(context)
                  : _contentFruitsList(),
            ],
          ),
        );
      },
    );
  }

  Center _buildEmptyList(BuildContext context) {
    return Center(
      child: Icon(
        CupertinoIcons.nosign,
        size: 40,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _contentFruitsList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: TwaivSpacing.medium,
        mainAxisSpacing: TwaivSpacing.medium,
        childAspectRatio: 1,
      ),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        return _contentDraggableItem(context, tray.fruits[index]);
      },
      itemCount: tray.fruits.length,
    );
  }

  Widget _contentDraggableItem(BuildContext context, Fruit fruit) {
    return Draggable(
      data: DnDRaw(fruit: fruit, tray: tray),
      feedback: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Color(fruit.backgroundColor),
          borderRadius: BorderRadius.circular(TwaivBorderRadius.big),
        ),
        child: Image.asset(
          fruit.image,
          height: 80,
          width: 80,
        ),
      ),
      childWhenDragging: Container(),
      child: _contentItemFruit(fruit, context),
    );
  }

  Widget _contentItemFruit(Fruit fruit, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(fruit.backgroundColor),
        borderRadius: BorderRadius.circular(TwaivBorderRadius.big),
      ),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: TwaivSpacing.largeXxl),
            alignment: Alignment.center,
            child: Image.asset(
              fruit.image,
              height: 80,
              width: 80,
            ),
          ),
          Positioned(
            top: TwaivSpacing.smallMedium,
            left: TwaivSpacing.medium,
            child: Text(
              fruit.name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
