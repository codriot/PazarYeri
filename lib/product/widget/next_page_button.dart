import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.page, this.canGo = false});
  final bool canGo;
  final String page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            if (canGo) {
              Get.offAndToNamed(page);
            }
            null;
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8.0),
            child: Text(
              'Devam Et',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
