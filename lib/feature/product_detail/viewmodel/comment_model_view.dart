import 'package:turkiye_yazilim_staj/feature/product_detail/model/comment_model.dart';

class CommentModelView {
  List<CommentModel> comments = List.generate(
    20,
    (index) => CommentModel(
      rating: 4.3,
      comment:
          "Çok. İyi bir ürün cildime çok iyi geldi ve nem sayesinde daha yumuşak bir cildim oldu. Kargo sıkıntılıydı 1  yıldız eksik verdim :)",
      date: " - 08 Mart 2023 13:35",
      name: "A*** Ç***",
    ),
  );
}
