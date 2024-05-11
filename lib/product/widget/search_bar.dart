import 'package:flutter/material.dart';

//notlar bcgrouncolor düzenlenecek controller verilecek ve onchanged düzenlenecek on submit callback verilecek

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.hintText});
  final String hintText;
  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  IconData _icon = Icons.search;
  void _onTap() {
    setState(() {
      _icon = Icons.arrow_back;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Ara...',
      leading: Icon(_icon),
      onChanged: (String text) {
        // Kullanıcının girdiği metne göre arama işlemini gerçekleştirin.
        _onTap();
        if (text.isEmpty) {
          setState(() {
            _icon = Icons.search;
          });
        }
      },

      //  backgroundColor: , daha sonra düzelt
      onTap: () {
        _onTap();
        // Arama çubuğuna tıklandığında gerçekleşecek işlemler.
      },
      onSubmitted: (String text) {
        // Arama sorgusu gönderildi.
      },
    );
  }
}
