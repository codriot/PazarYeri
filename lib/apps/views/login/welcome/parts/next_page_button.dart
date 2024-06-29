part of '../welcome_view.dart';

class NextPageButton extends StatelessWidget {
  const NextPageButton({required this.page, super.key, this.canGo = false});
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
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
            child: Text(
              'Kodu Gönder',
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
