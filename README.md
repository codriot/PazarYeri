# Pazar Yeri

## Proje Açıklaması
Pazar Yeri bir e-ticaret uygulamasıdır. Kullanıcılar popüler ürünleri keşfedebilir, fırsat ürünlerini bulabilir, sepetlerine ürün ekleyebilir ve favori ürünlerini listeleyebilir. Ayrıca, kullanıcılar bakiyelerini görüntüleyebilir, satın alabilir, para yükleyebilir ve harcamalarını takip edebilirler.

## Özellikler
- **Ana Ekran:** Kaydırılabilir kampanya penceresi, Çok Satanlar, Fırsat Ürünleri, Sana Özel, Kategoriler butonları, influencer önerileri, büyük indirimler ve popüler ürünler.
- **Sepet:** Kullanıcılar ürünleri sepetlerine ekleyebilir ve satın alma işlemlerini gerçekleştirebilir.
- **Favoriler:** Beğenilen ürünler favorilere eklenip düzenlenebilir.
- **Cüzdan:** Bakiye görüntüleme, para yükleme ve harcamaları takip etme.
- **Geçmiş Siparişler:** Önceki siparişlerin görüntülenmesi.
- **Adresler:** Kullanıcı adres bilgilerini yönetme.
- **Kartlarım:** Ödeme kartlarının yönetimi.
- **Hesap Ayarları ve Profil:** Kullanıcı bilgilerini ve hesap ayarlarını yönetme.
- **Ürün Arama:** Marka veya kategoriye göre ürün arama.
- **Giriş ve Kayıt Ekranları:** Telefon numarası ile giriş, doğrulama ve kayıt işlemleri.
- Ve daha pek çok ekran... 

  
![PazarYeri](https://github.com/user-attachments/assets/96440fdc-1aee-47ef-a15c-86805ae7c315)

## Kullanılan Teknolojiler
- **Flutter:** Mobil uygulama geliştirme çerçevesi.
- **Python Flask:** Backend geliştirme ve API sunucusu.
- **Dio:** İnternetten veri alma ve gönderme işlemleri.
- **GetX:** State management.
- **GetStorage:** DB işlemleri.
- **Envied:** Environment variable'ların korunması.
- **Flutter_gen_runner:** Kod oluşturma.
- **Very_good_analysis:** Kod analizi.
- **Logger:** Loglama.

## Kurulum
Projeyi kendi cihazınızda çalıştırmak için aşağıdaki adımları izleyin:

1. Bu projeyi klonlayın:
    ```bash
    git clone https://github.com/kullanıcı_adı/pazar_yeri.git
    ```

2. Proje dizinine gidin:
    ```bash
    cd pazar_yeri
    ```

3. Gerekli paketleri yükleyin:
    ```bash
    flutter pub get
    ```
4. Uygulamanızın assets/env/.dev.env dosyasını ekleyin içine 
```
BASE_URL = Your_Base_Url
API_KEY = Your_Api_Key
```

5. Bir kez build_runneri çalıştırın.

6. Uygulamayı çalıştırın:
    ```bash
    flutter run
    ```



## Geliştirme Prensipleri
- **SOLID:** Yazılım geliştirme kurallarına uygun kod yazımı.
- **Çalınmaya Karşı Koruma:** Environment variable'ların (base_url ve api_key) korunması.

## Katkıda Bulunanlar
- [Codriot](github.com/codriot) - Proje Yöneticisi ve Baş Geliştirici

## Katkıda Bulunma
Katkıda bulunmak isterseniz, lütfen bir pull request gönderin veya bir issue açın. Her türlü katkı ve geri bildirim memnuniyetle karşılanacaktır.

## Lisans
Bu proje MIT Lisansı altında lisanslanmıştır - ayrıntılar için LICENSE dosyasına bakın.
