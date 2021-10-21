import 'dart:io';

import 'package:c2_antonio_hany/data_classes/logged_user.dart';
import 'package:c2_antonio_hany/managers/main_api_repo.dart';
import 'package:connectivity/connectivity.dart';

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

String gDomain = "cbd3-185-120-28-52.eu.ngrok.io";

LoggedUser? gLoggedUser;
