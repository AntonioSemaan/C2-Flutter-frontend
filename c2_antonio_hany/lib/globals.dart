import 'dart:io';

import 'package:c2_antonio_hany/data_classes/user.dart';
import 'package:c2_antonio_hany/enums.dart';
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

String gDomain = "412c-185-120-28-52.eu.ngrok.io";

User? gLoggedUser;


