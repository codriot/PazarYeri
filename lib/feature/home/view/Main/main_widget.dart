part of 'main_screen.dart';

// Todo HasNotification getx ile yapılacak
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.HasNotification = false});
  final bool? HasNotification;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "PAZARYERİ",
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: HasNotification!
              ? Image.asset("assets/images/HasNotification.png", width: 30)
              : Image.asset("assets/images/notification.png", width: 30),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
