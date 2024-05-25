import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:turkiye_yazilim_staj/feature/products/search/model/searched_product_model.dart';
import 'package:turkiye_yazilim_staj/feature/products/search_result/view/search_result_view.dart';
import 'package:turkiye_yazilim_staj/product/service/service_manager.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';

// Notlar: Arkaplan rengi düzenlenecek, controller eklenecek ve onChanged düzenlenecek, onSubmit callback verilecek
class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();
  late FocusNode _focusNode;

  final IconData _icon = Icons.arrow_back;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.requestFocus();
  }

  void _onTap() {
    _focusNode.requestFocus();
  }

  void _onLeadingIconButtonPressed() {
    _controller.clear();
    FocusScope.of(context).unfocus();
    Get.back();
  }

  Future<void> _onSubmitted(String text) async {
    // Arama sorgusu gönderildi.
    Logger().i('Arama sorgusu gönderildi: $text');
    Logger().i(
      'Arama sorgusu gönderildi: ${ServicePath.product_search.path + text}',
    );

    try {
      final response = await NetworkManager()
          .getRequest(ServicePath.product_search.path + text);
      Logger().i('Arama sonuçları: ${response.data}');

      // `products` anahtarına sahip veriyi al
      final productListData = response.data!['products'] as List<dynamic>;

      // Veriyi `SearchedProductItem` modellerine dönüştür
      final productList = productListData.map((productJson) {
        return SearchedProductItem.fromJson(
          productJson as Map<String, dynamic>,
        );
      }).toList();

      // Yeni sayfaya yönlendirme ve productList'i argüman olarak gönderme
      await Get.to(SearchResultPage.new, arguments: productList);
    } catch (e) {
      // Hata işleme
      Logger().e('Arama sorgusu işlenirken hata oluştu: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      constraints: const BoxConstraints(maxHeight: 50),
      controller: _controller,
      focusNode: _focusNode,
      textStyle: WidgetStateProperty.all<TextStyle>(
        Theme.of(context).textTheme.bodyLarge!,
      ),
      leading: IconButton(
        onPressed: _onLeadingIconButtonPressed,
        icon: Icon(_icon, color: ColorsProject.apricotSorbet),
      ),
      backgroundColor: WidgetStateProperty.all<Color>(Colors.grey.shade100),
      onTap: _onTap,
      onSubmitted: _onSubmitted,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
