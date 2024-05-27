import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';

class AddNewInfo extends StatelessWidget {
  const AddNewInfo({
    required this.title,
    required this.icon,
    required this.onPressed,
    super.key,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        side: const BorderSide(
          color: ColorsProject.apricotSorbet,
          width: 2,
        ),
        elevation: 10,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ColorsProject.apricotSorbet,
            ),
            const Spacer(),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
