import 'package:get_storage/get_storage.dart';

// ? singleton mı olmalı yoksa mixin mi olmalı?
/// StorageUtil mixin
class StorageUtil {
  /// Storage instance
  final _box = GetStorage();
  final String _Userkey = 'userId';
  static const String _key = 'oldSearches';

  /// User id get
  int getUserId() {
    return _box.read(_Userkey) ?? 0;
  }

  /// set user id
  void setUserId(int userId) {
    _box.write(_Userkey, userId);
  }

  /// remove user id
  void removeUserId() {
    _box.remove(_Userkey);
  }

  /// get old searches
  List<String> getOldSearches() {
    return _box.read<List<dynamic>>(_key)?.cast<String>() ?? [];
  }

  /// add new search
  void addSearch(String arama) {
    final eskiAramalar = getOldSearches();
    eskiAramalar.add(arama);
    _box.write(_key, eskiAramalar);
  }

  /// remove search
  void removeSearch(String arama) {
    final eskiAramalar = getOldSearches();
    eskiAramalar.remove(arama);
    _box.write(_key, eskiAramalar);
  }
}
