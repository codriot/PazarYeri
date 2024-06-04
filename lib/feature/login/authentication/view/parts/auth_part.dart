part of '../auth_view.dart';

class Countdown extends AnimatedWidget {
  const Countdown({required this.animation, super.key})
      : super(listenable: animation);
  final Animation<int> animation;

  @override
  Text build(BuildContext context) {
    final clockTimer = Duration(seconds: animation.value);

    final timerText =
        '${clockTimer.inMinutes.remainder(60)}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return Text(
      timerText,
      style: Theme.of(context)
          .textTheme
          .labelSmall!
          .copyWith(color: ColorsProject.apricotSorbet),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    required this.page,
    super.key,
  });
  final String page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.offAndToNamed(page);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
            child: Text(
              'Onayla',
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
