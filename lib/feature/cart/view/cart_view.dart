import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/product/widget/comment_ui.dart';
import 'package:turkiye_yazilim_staj/product/widget/search_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
//!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsets.only(
                  top: Get.width * 0.03,
                  left: Get.height * 0.03,
                  right: Get.height * 0.03),
              child: Column(
                children: [
                  const Expanded(
                      flex: 2,
                      child: CustomSearchBar(hintText: "favorilerde ara...")),
                  const Spacer(),
                  Expanded(
                    flex: 20,
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        //burada favori ürünlerin listeleneceği widget olacak
                        return const CartItem();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: _completeShopping(context),
          ),
        ],
      ),
    );
  }

  Container _completeShopping(BuildContext context) {
    return Container(
      height: Get.height * 0.1,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("368,00₺", style: Theme.of(context).textTheme.titleLarge),
              Text("TOPLAM TUTAR",
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Alışverişi Tamamla",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        elevation: 5,
        color: Colors.grey.shade100,
        margin: const EdgeInsets.only(bottom: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: () {
            // Ürüne tıklandığında yapılacak işlemler
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 130,
                      width: 130,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            "assets/images/productPhoto.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "El kremi - Dynamic 100 ml Nivea",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Text(
                          "100,00₺",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Kargo Bedava",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 10),
                                ),
                              ),
                            ),
                            const SizedBox(width: 3),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Hızlı teslimat",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 10)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
          height: 40,
          width: double.infinity,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 7,
                spreadRadius: 1,
                offset: Offset(0, 2),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Satıcı: ',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.grey.shade700,
                            )),
                    TextSpan(
                        text: 'Emre Armağan',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              const StarPoint(text: "4.3")
            ],
          )),
    ]);
  }
}
