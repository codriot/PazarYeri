import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/product/util/storage/storage_util.dart';

class SearchViewModel extends GetxController {
  RxList<String> aramaGecmisi = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    aramaGecmisi.addAll(StorageUtil().getOldSearches());
  }

  /// Adds the search to the search history
  void addSearch(String arama) {
    StorageUtil().addSearch(arama);
    aramaGecmisi.add(arama);
  }

  ///   Removes the search from the search history
  void removeSearch(String arama) {
    StorageUtil().removeSearch(arama);
    aramaGecmisi.remove(arama);
  }
}
