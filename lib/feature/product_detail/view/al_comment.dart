import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/product_detail/viewmodel/comment_model_view.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/widget/comment_ui.dart';

class AllCommentView extends StatefulWidget {
  const AllCommentView({super.key});

  @override
  State<AllCommentView> createState() => _AllCommentViewState();
}

class _AllCommentViewState extends State<AllCommentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ScrollPhysics(),
        children: [
          //Todo: commentlerin yanı sıra product detailin dealeri de eklenecek
          // SellerReview(
          //   photoPath: "assets/images/productPhoto.png",
          //   hata: 'hata',
          //   context: context,
          // ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: CommentModelView().comments.length,
            itemBuilder: (BuildContext context, int index) {
              return CommentSection(
                comment: CommentModelView().comments[index],
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
            spreadRadius: 4,
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      height: Get.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(child: SizedBox()),
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
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
