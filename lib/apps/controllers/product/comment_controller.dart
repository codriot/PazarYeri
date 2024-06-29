import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/apps/models/comment_model.dart';
import 'package:turkiye_yazilim_staj/apps/models/product_model.dart';

/// CommentController is a GetxController class that is responsible for
/// managing the comments of the product.
class CommentController extends GetxController {
  RxList<CommentModel> comments = <CommentModel>[].obs;
  Rx<ProductModel> product = ProductModel().obs;

  @override
  void onInit() {
    super.onInit();
    // comments(Get.arguments as List<CommentModel>).map((e) => e).toList();

    // Get.arguments ile gelen verileri alın
    final arguments = Get.arguments;

    // İlk önce yorumları (comments) ve sonra ürünü (product) alın
    final comments = arguments[0] as List<CommentModel>;
    final product = arguments[1] as ProductModel;

    // Verileri kontrolcülerde saklayın
    this.comments(comments);
    this.product(product);
  }
}
