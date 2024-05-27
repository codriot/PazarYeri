part of 'product_detail.dart';

mixin ProductDetailUtil on State<ProductDetailView> {
  String hata = 'Hata  oluştu';

  final controller = Get.put(ProductDetailViewModel());

  Container _cardAndComment(BuildContext context, String hata) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _priceAndAddCart(context),
            SellerReview(
              hata: hata,
              context: context,
              name: controller.product.value?.dealer,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 18),
              child: Text(
                'Ürün Değerlendirmeleri',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: Get.height * 0.5,
              decoration: BoxDecoration(
                color: ColorsProject.grey.withOpacity(0.06),
                borderRadius: BorderRadius.circular(21),
                border: Border.all(
                  color: ColorsProject.grey.withOpacity(0.3),
                  width: 1.5,
                ),
              ),
              child: Stack(
                children: [
                  Obx(
                    () {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return CommentSection(
                              comment: controller.comments![index],
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(
                          Navigate.allcomment.route,
                          arguments: controller.comments,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(21),
                            bottomRight: Radius.circular(21),
                          ),
                        ),
                      ),
                      child: Text(
                        'TÜMÜNÜ GÖR (${controller.comments!.length}) Yorum',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _firstReview(
    String hata,
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ürün adı
          Text(
            controller.product.value?.name ?? hata,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          // Ürün Kodu
          Text(
            controller.product.value?.productCode ?? hata,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorsProject.grey.withOpacity(0.6),
                ),
          ),
          //değerlendirme
          const StarAndComment(),

          // Açıklama
          Text(
            controller.product.value?.description ?? hata,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: CustomDivider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('ADET'),
              _counterWidget(),
            ],
          ),

          // Butonlar
        ],
      ),
    );
  }

  Row _priceAndAddCart(BuildContext context) {
    return Row(
      children: [
        // Favorilere ekle
        Flexible(
          fit: FlexFit.tight,
          child: ListTile(
            title: Text(
              '${controller.product.value?.price} ₺',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: Text(
              'Toplam Tutar',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
        // Sepete ekle
        SizedBox(
          width: 150,
          //! sağ köşede sıkışmış fix
          child: ElevatedButton(
            onPressed: () {
              controller.addCard(
                CartModel(
                  productId: controller.product.value!.productId,
                  amount: controller.count.value,
                ),
              );
              Get.dialog<_AddedToCartDialog>(
                const _AddedToCartDialog(),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
              child: Text(
                'SEPETE EKLE',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.white,
                  shadows: [
                    const BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container _counterWidget() {
    return Container(
      width: 100,
      height: 32,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _counterButton(controller.decrementCount, Icons.remove),
          Obx(
            () => Text('${controller.count.value}'),
          ), // Obx widget'ı kullanıldı
          _counterButton(controller.incrementCount, Icons.add),
        ],
      ),
    );
  }

  SizedBox _counterButton(void Function() onPressed, IconData icon) {
    return SizedBox(
      height: 30,
      width: 30,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(1, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            size: 10,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Stack productPhoto(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Fotoğraf
        SizedBox(
          height: 460,
          width: context.width,
          child: Image.network(
            controller.product.value?.image ?? '',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const ColoredBox(
                color: Colors.grey,
                child: Center(
                  child: Text(
                    'Resim yüklenemedi',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
        // Geri tuşu
        Positioned(
          top: 40,
          left: 15,
          child: MinimalButton(
            icon: Icons.arrow_back,
            onPressed: () => Get.back<void>(),
          ),
        ),
        Positioned(
          top: 40,
          right: 15,
          child: MinimalButton(
            icon: Icons.favorite,
            onPressed: () {
              controller.addFavorite(controller.product.value!.productId!);
            },
          ),
        ),
      ],
    );
  }
}

//  : commentleri eklerken unutma
class StarAndComment extends StatelessWidget {
  const StarAndComment({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          // Yıldızlar

          const StarPoint(
            text: '4.3',
          ),

          const Stars(rating: 4.3),
          // Değerlendirme sayısı
          // ! divider  görünmüyor
          const CustomVerticalDivider(),

          Text(
            '200 Değerlendirme',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorsProject.grey,
                ),
          ),
        ],
      ),
    );
  }
}

class SellerReview extends StatelessWidget {
  const SellerReview({
    required this.hata,
    required this.context,
    required this.name,
    this.photoPath,
    super.key,
  });
  final String hata;
  final BuildContext context;
  final String? photoPath;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
          name ?? hata,
        ),
        subtitle: const StarAndComment(),
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
            image: (photoPath == null)
                ? null
                : DecorationImage(
                    image: AssetImage(photoPath!),
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
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.images.addedToCart.path),
                Text(
                  'Ürün sepete eklendi',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ColorsProject.apricotSorbet,
                      ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Siparişinize devam etmek için Sepete gidebilirsiniz ve alışverişe kaldığınız yerden devam edebilirsiniz.',
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.back<void>();
                      Get.toNamed(Navigate.cart.route);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: ColorsProject.apricotSorbet,
                      side: const BorderSide(
                        color: ColorsProject.apricotSorbet,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text('Sepete Git'),
                    ),
                  ),
                ), // sepete gönder
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () => Get.back<void>(),
                    child: const Text(
                      'Alışverişe Devam Et',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ), // alışverişe devam et
              ],
            ),
          ),
        ),
        Positioned(
          left: context.width * 0.115,
          top: context.height * 0.18,
          child: IconButton(
            icon: const Icon(Icons.close, size: 32, color: Colors.grey),
            onPressed: () {
              Get.back<void>();
            },
          ),
        ),
      ],
    );
  }
}

class MinimalButton extends StatelessWidget {
  const MinimalButton({required this.icon, required this.onPressed, super.key});
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
