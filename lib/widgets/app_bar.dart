import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:twaiv_test/theme/spacing.dart';

/// [AppBarHeader] is a widget that displays the header of the home screen.
class AppBarHeader extends StatelessWidget {
  /// constructor
  const AppBarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(
            Icons.person,
            color: Colors.white54,
          ),
        ),
        const SizedBox(width: TwaivSpacing.normal),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      'Hey Alain, Welcome',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Badge(
          badgeContent: Text(
            '2',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white),
          ),
          position: BadgePosition.topEnd(end: -6),
          child: Icon(
            CupertinoIcons.bell,
            color: Theme.of(context).textTheme.titleMedium!.color,
          ),
        ),
        const SizedBox(width: TwaivSpacing.small),
      ],
    );
  }
}
