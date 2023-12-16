import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twaiv_test/theme/border_radius.dart';
import 'package:twaiv_test/theme/spacing.dart';

/// {@template search_box}
/// Search box widget
/// {@endtemplate}
class SearchBox extends StatelessWidget {
  /// {@macro search_box}
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: TwaivSpacing.large,
        right: TwaivSpacing.large,
        bottom: TwaivSpacing.medium,
      ),
      padding: const EdgeInsets.all(TwaivBorderRadius.normal),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Fruits, foods and drinks...',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
            ),
            VerticalDivider(
              color: Colors.grey.withOpacity(0.6),
              width: 20,
              thickness: 1,
            ),
            GestureDetector(
              onTap: () {},
              child: Icon(
                CupertinoIcons.slider_horizontal_3,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
