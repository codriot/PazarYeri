import 'package:turkiye_yazilim_staj/feature/product_detail/model/Product_detail_model.dart';
import 'package:turkiye_yazilim_staj/feature/product_detail/model/dealer_model.dart';

class ProductDetailViewModel {
  ProductDetailModel profileViewModel = ProductDetailModel(
    name: 'M.Lawrence Serum',
    description: 'Yüz bakım Serumu  PZ5354686',
    description2:
        'Yüzünüze parlaklık ve nem verir. Sivilce akne oluşumunu önler.  Üstelik içindeki C vitamini sayesinde vücudunuzun cilt bariyerini güçlendirir.',
    price: 100.0,
    imagePath: 'assets/images/productPhoto.png',
    commentCount: 200,
    star: 4.3,
    commentList: [],
    dealer: Dealer(
        name: "Emre Armağan",
        photoPath:
            ''), //* normalde pathe assets\images\profilepp.png vercektim ama fotoğrafı tasarımda verilmemiş
  );
}
