import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/product/product_detail/model/comment_model.dart';

class CommentViewModel extends GetxController {
  RxList<CommentModel> comments = <CommentModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    comments(Get.arguments as List<CommentModel>).map((e) => e).toList();
  }
}
