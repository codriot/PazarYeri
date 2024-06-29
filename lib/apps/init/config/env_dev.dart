import 'package:envied/envied.dart';
import 'package:turkiye_yazilim_staj/apps/init/config/app_config_interface.dart';

part 'env_dev.g.dart';

@Envied(obfuscate: true, path: 'assets/env/.dev.env')
final class DevEnv implements AppConfigInterface {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _DevEnv._baseUrl;
  @EnviedField(varName: 'API_KEY')
  static final String _apiKey = _DevEnv._apiKey;

  @override
  // TODO: implement apiKey
  String get apiKey => _apiKey;

  @override
  // TODO: implement baseUrl
  String get baseUrl => _baseUrl;
}
