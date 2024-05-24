import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/feature/deneme/deneme_contoller.dart';

class DenemeView extends StatefulWidget {
  const DenemeView({super.key});

  @override
  State<DenemeView> createState() => _DenemeViewState();
}

class _DenemeViewState extends State<DenemeView> {
  DenemeController controller = DenemeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
            future: controller.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Hata'));
              } else {
                return Image.network(
                  controller.discountUrls[0] ??
                      'https://via.placeholder.com/150',
                );
              }
            },
          ),

          Image.network(
            'https://via.placeholder.com/150',
          ),
          // Image.network(
          //   controller.sliderImagePaths[0] ?? 'https://via.placeholder.com/150',
          // ),
          const Center(
            child: Text('Deneme'),
          ),
        ],
      ),
    );
  }
}
