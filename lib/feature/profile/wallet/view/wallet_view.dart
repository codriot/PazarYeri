import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 2),
          Expanded(
            flex: 14,
            child: Container(
              decoration: BoxDecoration(
                color: ColorsProject.titanium,
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage("assets/images/wallet.png"),
                  fit: BoxFit.cover,
                ),
              ),
              height: 200,
              width: 400,
              child: const Column(
                children: [
                  Text("Toplam Bakiye"),
                  Text("₺ 0.00"),
                ],
              ),
            ),
          ),
          const Spacer(),
          Text(
            "Hareketlerim",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Spacer(),
          Text(
            "Recent Transactions",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Spacer(),
          Expanded(
            flex: 34,
            child: Container(
              //Todo widgeti tasarla
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
