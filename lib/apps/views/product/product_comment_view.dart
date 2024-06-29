import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/apps/controllers/product/comment_controller.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/const/colors.dart';
import 'package:turkiye_yazilim_staj/apps/widgets/comment_ui.dart';
import 'package:turkiye_yazilim_staj/apps/widgets/general_app_bar.dart';

class AllCommentView extends StatefulWidget {
  const AllCommentView({super.key});

  @override
  State<AllCommentView> createState() => _AllCommentViewState();
}

class _AllCommentViewState extends State<AllCommentView> {
  final controller = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBar(
        colorsAppBar: Colors.white,
      ),
      body: Stack(
        children: [
          _allComment(),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _commentAndAddCardWidget(),
          ),
        ],
      ),
    );
  }

  Padding _allComment() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 60),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 12,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    controller.product.value.image ?? '',
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.product.value.name ?? '',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      controller.product.value.productCode ?? '',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorsProject.grey,
                          ),
                    ),
                    const StarAndComment(),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: ColorsProject.grey.withOpacity(0.13),
            thickness: 1,
            endIndent: 15,
            indent: 15,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.comments.length,
            itemBuilder: (BuildContext context, int index) {
              return CommentSection(
                comment: controller.comments[index],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _commentAndAddCardWidget extends StatelessWidget {
  const _commentAndAddCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      height: Get.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(),
          Expanded(
            flex: 3,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: ColorsProject.apricotSorbet),
              ),
              onPressed: () {},
              child: const Text(
                'Yorum Yap',
                style: TextStyle(color: ColorsProject.apricotSorbet),
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Expanded(
            flex: 3,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Sepete Ekle',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
