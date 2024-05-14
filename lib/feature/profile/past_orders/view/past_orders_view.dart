import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/product/widget/search_bar.dart';

class PastOrdersView extends StatelessWidget {
  const PastOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          const CustomSearchBar(
            hintText: 'Ara...',
          ),
          const Spacer(),
          Expanded(
            flex: 18,
            child: Container(
              //Todo widgeti tasarla
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
