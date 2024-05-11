part of 'product_detail.dart';

class StarAndComment extends StatelessWidget {
  const StarAndComment({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          // Yıldızlar
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                ProductDetailViewModel().profileViewModel.star.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const Stars(rating: 4.3),
          // Değerlendirme sayısı
          // ! divider  görünmüyor
          const CustomVerticalDivider(),

          Text(
            "${ProductDetailViewModel().profileViewModel.commentCount} Değerlendirme",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  color: ColorsProject.grey,
                ),
          ),
        ],
      ),
    );
  }
}

class SellerReview extends StatelessWidget {
  final String hata;
  final BuildContext context;
  final String? PhotoPath;

  const SellerReview(
      {required this.hata, required this.context, this.PhotoPath, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
            ProductDetailViewModel().profileViewModel.dealer?.name ?? hata),
        subtitle: const StarAndComment(),
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
            image: (PhotoPath == null)
                ? null
                : DecorationImage(
                    image: AssetImage(PhotoPath!),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}
