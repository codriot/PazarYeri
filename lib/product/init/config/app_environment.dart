import 'package:turkiye_yazilim_staj/product/init/config/app_config_interface.dart';
import 'package:turkiye_yazilim_staj/product/init/config/env_dev.dart';

/// app environment Manager
class AppEnvironment {
  /// This method is used to setup the app environment
  /// kdebug ve release olarak iki ayrı şekilde çalıştırılabilir loggerla bilgi ver

  static final AppConfigInterface _config = DevEnv();

  /// This method is used to get the base url
  static String get baseUrl => _config.baseUrl;

  /// This method is used to get the api key
  static String get apiKey => _config.apiKey;
}

enum EnvironmentItem {
  baseUrl,
  apiKey;

  String get value {
    switch (this) {
      case EnvironmentItem.baseUrl:
        return AppEnvironment._config.baseUrl;
      case EnvironmentItem.apiKey:
        return AppEnvironment._config.apiKey;
    }
  }
}
