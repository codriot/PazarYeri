import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.page, this.isreturn = true});
  final dynamic page;
  final bool isreturn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Center(
        child: ElevatedButton(
          onPressed: () => isreturn ? Get.to(page) : Get.off(page),
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
