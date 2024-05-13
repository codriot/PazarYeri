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

class _AddedToCartDialog extends StatelessWidget {
  const _AddedToCartDialog();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Dialog(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/added_to_cart.png"),
                Text(
                  'Ürün sepete eklendi',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ColorsProject.apricotSorbet,
                      ),
                ),
                const SizedBox(height: 10),
                const Text(
                    "Siparişinize devam etmek için Sepete gidebilirsiniz ve alışverişe kaldığınız yerden devam edebilirsiniz."),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: ColorsProject.apricotSorbet,
                        side: const BorderSide(
                            color: ColorsProject.apricotSorbet),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text("Sepete Git"),
                      )),
                ), // sepete gönder
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      onPressed: Get.back,
                      child: const Text(
                        "Alışverişe Devam Et",
                        style: TextStyle(color: Colors.white),
                      )),
                ), // alışverişe devam et
              ],
            ),
          ),
        ),
        Positioned(
          left: 50,
          top: 90,
          child: IconButton(
            icon: const Icon(Icons.close, size: 32, color: Colors.grey),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}

class MinimalButton extends StatelessWidget {
  const MinimalButton({super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        onPressed: onPressed,
      ),
    );
  } //! fix this
}
