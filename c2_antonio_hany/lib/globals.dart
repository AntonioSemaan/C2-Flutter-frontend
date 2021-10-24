import 'dart:io';

import 'package:c2_antonio_hany/data_classes/user.dart';
import 'package:c2_antonio_hany/enums.dart';
import 'package:c2_antonio_hany/managers/main_api_repo.dart';
import 'package:connectivity/connectivity.dart';
import 'package:intl/intl.dart';

Future<bool> gCheckInternetConnection() async {
  try {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  } on SocketException catch (_) {
    return false;
  }
}

String gDomain =
    "c2jobook.herokuapp.com"; // => => comment to use locally and uncomment below
// String gDomain = "localhost";  => uncomment to use locally and comment above

User? gLoggedUser;

DateFormat gDatabaseFormat = DateFormat("yyyy-MM-dd");
DateFormat gDatabaseStampFormat = DateFormat("yyyy-MM-dd hh:mm:ss.S");
DateFormat gNormalFormat = DateFormat("dd/MM/yyyy");
