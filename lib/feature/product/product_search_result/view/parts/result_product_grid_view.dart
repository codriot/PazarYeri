part of '../search_result_view.dart';

class buildProductGridView extends StatelessWidget {
  const buildProductGridView({
    required this.controller,
    super.key,
  });

  final SearchResultController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        childAspectRatio: 0.55, // 4:3 aspect ratio
      ),
      itemCount: controller.productList.length,
      itemBuilder: (context, index) {
        return ResultItem(
          product: controller.productList[index],
        );
      },
    );
  }
}
