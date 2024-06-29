part of '../search_view.dart';

class OldSearchedWordsList extends StatelessWidget {
  const OldSearchedWordsList({
    required this.searchController,
    super.key,
  });

  final SearchProductController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      height: Get.height * 0.5,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      child: Obx(() {
        return ListView.builder(
          itemCount: searchController.searchHistory.length,
          itemBuilder: (context, index) {
            final search = searchController.searchHistory[index];
            return Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          searchController.removeSearch(search);
                        },
                        icon: const Icon(
                          Icons.clear,
                          size: 25,
                        ),
                      ),
                    ),
                    TextButton(
                      child: Text(
                        search,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      onPressed: () async {
                        await Get.offAndToNamed(
                          Navigate.searchResult.route,
                          arguments: search,
                        );
                      },
                    ),
                    const Spacer(
                      flex: 15,
                    ),
                  ],
                ),
                const Divider(
                  endIndent: 10,
                  indent: 10,
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
