import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twaiv_test/data/model/tray.dart';
import 'package:twaiv_test/pages/blocs/trays/trays_bloc.dart';
import 'package:twaiv_test/pages/tray_item.dart';
import 'package:twaiv_test/theme/spacing.dart';

class TraysSuccessList extends StatelessWidget {
  const TraysSuccessList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TraysBloc, TraysState>(
      builder: (context, state) {
        switch (state.status) {
          case TraysStatus.success:
            return _buildTraysList(state.trays);
          case TraysStatus.error:
            return const Center(child: CupertinoActivityIndicator());
          case TraysStatus.loading:
            return Center(child: Text(state.message));
        }
      },
    );
  }

  ListView _buildTraysList(List<Tray> trays) {
    return ListView.separated(
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
    );
  }
}
