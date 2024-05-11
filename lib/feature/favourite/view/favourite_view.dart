import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/product/widget/search_bar.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
              flex: 2, child: CustomSearchBar(hintText: "favorilerde ara...")),
          const Spacer(),
          Expanded(
            flex: 20,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                //burada favori ürünlerin listeleneceği widget olacak
                return Container(
                  color: Colors.purple,
                  height: 100,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
