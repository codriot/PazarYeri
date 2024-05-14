// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class Kullanici {
  String ad;
  String soyad;
  DateTime dogumTarihi;
  String cinsiyet;
  String epostaAdresi;
  String egitimDurumu;
  List<String> hobiler;

  Kullanici({
    required this.ad,
    required this.soyad,
    required this.dogumTarihi,
    required this.cinsiyet,
    required this.epostaAdresi,
    required this.egitimDurumu,
    required this.hobiler,
  });

  @override
  bool operator ==(covariant Kullanici other) {
    if (identical(this, other)) return true;

    return other.ad == ad &&
        other.soyad == soyad &&
        other.dogumTarihi == dogumTarihi &&
        other.cinsiyet == cinsiyet &&
        other.epostaAdresi == epostaAdresi &&
        other.egitimDurumu == egitimDurumu &&
        listEquals(other.hobiler, hobiler);
  }
}
