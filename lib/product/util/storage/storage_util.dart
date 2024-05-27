import 'package:get_storage/get_storage.dart';

// ? singleton mı olmalı yoksa mixin mi olmalı?
/// StorageUtil mixin
class StorageUtil {
  /// Storage instance
  final box = GetStorage();
  final String _Userkey = 'userId';

  /// Kullanıcı kimliğini döndürür
  int getUserId() {
    return box.read(_Userkey) ?? 0;
  }

  /// Kullanıcı kimliğini ayarlar
  void setUserId(int userId) {
    box.write(_Userkey, userId);
  }

  void removeUserId() {
    box.remove(_Userkey);
  }
}
