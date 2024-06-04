import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/storage/storage_util.dart';

class SearchProductController extends GetxController {
  RxList<String> searchHistory = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    searchHistory.addAll(StorageUtil().getOldSearches());
  }

  /// Adds the search to the search history
  void addSearch(String search) {
    StorageUtil().addSearch(search);
    searchHistory.add(search);
  }

  ///   Removes the search from the search history
  void removeSearch(String search) {
    StorageUtil().removeSearch(search);
    searchHistory.remove(search);
  }
}
