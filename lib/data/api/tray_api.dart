import 'package:twaiv_test/data/model/tray.dart';

abstract class TrayApi {
  Stream<List<Tray>> getTrays();
}
