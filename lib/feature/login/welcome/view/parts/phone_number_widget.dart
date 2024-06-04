part of '../welcome_view.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              height: 50,
              width: 50,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Telefon Numaranızı Giriniz',
                prefixIcon: Image(image: AssetImage(Assets.images.turkey.path)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
