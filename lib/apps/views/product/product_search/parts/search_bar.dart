part of '../search_view.dart';

// Notlar: Arkaplan rengi düzenlenecek, controller eklenecek ve onChanged düzenlenecek, onSubmit callback verilecek
class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();
  late FocusNode _focusNode;
  final searchController = Get.find<SearchProductController>();
  final IconData _icon = Icons.arrow_back;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      constraints: const BoxConstraints(maxHeight: 50),
      controller: _controller,
      focusNode: _focusNode,
      textStyle: WidgetStateProperty.all<TextStyle>(
        Theme.of(context).textTheme.bodyLarge!,
      ),
      leading: IconButton(
        onPressed: _onLeadingIconButtonPressed,
        icon: Icon(_icon, color: ColorsProject.apricotSorbet),
      ),
      backgroundColor: WidgetStateProperty.all<Color>(Colors.grey.shade100),
      onTap: _onTap,
      onSubmitted: (text) async {
        await _onSubmitted(text);
      },
    );
  }

  void _onTap() {
    _focusNode.requestFocus();
  }

  void _onLeadingIconButtonPressed() {
    _controller.clear();
    FocusScope.of(context).unfocus();
    Get.back<void>();
  }

  Future<void> _onSubmitted(String text) async {
    // await Get.to(SearchResultPage.new, arguments: productList);
    await Get.toNamed(Navigate.searchResult.route, arguments: text);
    // Arama sorgusu gönderildi.
    searchController.addSearch(text);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
