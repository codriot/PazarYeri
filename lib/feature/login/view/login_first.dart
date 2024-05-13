import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/feature/login/view/login_second.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/widget/next_page_button.dart';

class FirstLoginView extends StatelessWidget {
  const FirstLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: '+90');
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAZARYERİ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'Hoşgeldin,\nAramıza katil ve doyasıya alışveriş \nyap !'),
            // ! fix this part
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 50,
                  ),
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Telefon Numaranızı Giriniz',
                      prefixIcon:
                          Image(image: AssetImage('assets/images/turkey.png')),
                    ),
                  ),
                ]),
              ),
            ),
            Text(
              "Sana doğrulama kodu içeren bir SMS göndereceğiz. Kimseyle paylasmayiniz.",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: const Color(0xffC5C4C3)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset('assets/images/checkbox-circle-line.png'),
                  const SizedBox(width: 16),
                  Text(
                    "Gizlilik Politikası ve Sartlarinizi kabul ediyorum.",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorsProject.apricotSorbet,
                        ),
                  ),
                ],
              ),
            ),
            const NextButton(
              page: VerifyPage(),
              isreturn: false,
            ),
          ],
        ),
      ),
    );
  }
}
