import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';

// Notlar: Arkaplan rengi düzenlenecek, controller eklenecek ve onChanged düzenlenecek, onSubmit callback verilecek
class GeneralSearchBar extends StatefulWidget {
  const GeneralSearchBar({required this.hintText, super.key});
  final String hintText;

  @override
  State<GeneralSearchBar> createState() => _GeneralSearchBarState();
}

class _GeneralSearchBarState extends State<GeneralSearchBar> {
  final IconData _icon = Icons.search;
  final _focusNode = FocusNode();

  void _onTap() {
    Get.toNamed(Navigate.search.route);
    _focusNode.unfocus();
  }

  void _onLeadingIconButtonPressed() {
    Get.toNamed(Navigate.search.route);
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      focusNode: _focusNode,
      elevation: WidgetStateProperty.all<double?>(3),
      keyboardType: TextInputType.none,
      onTapOutside: (event) {},
      constraints: const BoxConstraints(maxHeight: 50),
      hintText: widget.hintText,
      leading: IconButton(
        onPressed: _onLeadingIconButtonPressed,
        icon: Icon(_icon, color: ColorsProject.apricotSorbet),
      ),
      backgroundColor: WidgetStateProperty.all<Color>(Colors.grey.shade100),
      onTap: _onTap,
    );
  }
}
