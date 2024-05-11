import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/feature/all_comments/model/comment_model.dart';
import 'package:turkiye_yazilim_staj/product/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/widget/divider.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({super.key, required this.comment});
  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: IntrinsicHeight(
              child: Row(children: [
                Stars(
                  rating: comment.rating!,
                ),
                const CustomVerticalDivider(),
                Text(
                  "${comment.name!} - ${comment.date!}",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorsProject.grey,
                      ),
                ),
              ]),
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
  const Stars({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          size: 12.0,
          color: index < 5 - rating.floor()
              ? Colors.grey
              : ColorsProject.apricot_sorbet,
        ),
      ),
    );
  }
}
