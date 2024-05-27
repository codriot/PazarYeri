import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:turkiye_yazilim_staj/product/init/config/app_environment.dart';

/// This class is responsible for initializing the project
@immutable
final class InitProject {
  /// This method is used to initialize the project

  /// This method is used to initialize the project bussiness logic
  Future<void> initProject() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    /// This method is used to handle the error
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);

      /// : add custom logger
      Logger().e(details.exception.toString());
    };
    // Environment setup
    /// app environment  product or dev olarak iki ayrı şekilde çalıştırılabilir loggerla bilgi ver
    AppEnvironment();
  }
}
