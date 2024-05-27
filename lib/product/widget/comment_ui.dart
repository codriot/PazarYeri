import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/feature/product/product_detail/model/comment_model.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({required this.comment, super.key});
  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Stars(
                    rating: comment.star!.toDouble(),
                  ),
                  const CustomVerticalDivider(),
                  Text(
                    '${comment.name!} - ${comment.date!}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorsProject.grey,
                        ),
                  ),
                ],
              ),
            ),
          ),
          subtitle: Text(
            comment.comment!,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  color: ColorsProject.grey.withOpacity(0.7),
                ),
          ),
        ),
        Divider(
          color: ColorsProject.grey.withOpacity(0.13),
          thickness: 1,
          endIndent: 15,
          indent: 15,
        ),
      ],
    );
  }
}

class Stars extends StatelessWidget {
  const Stars({required this.rating, super.key});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          size: 12,
          color: index < 5 - rating.floor()
              ? Colors.grey
              : ColorsProject.apricotSorbet,
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ColorsProject.grey.withOpacity(0.13),
      thickness: 1,
    );
  }
}

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      color: Colors.black,
      thickness: 0.5,
      endIndent: 3,
      indent: 3,
    );
  }
}

class StarPoint extends StatelessWidget {
  const StarPoint({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.green[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
