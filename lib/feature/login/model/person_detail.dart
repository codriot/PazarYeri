// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  @override
  int get hashCode {
    return ad.hashCode ^
        soyad.hashCode ^
        dogumTarihi.hashCode ^
        cinsiyet.hashCode ^
        epostaAdresi.hashCode ^
        egitimDurumu.hashCode ^
        hobiler.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ad': ad,
      'soyad': soyad,
      'dogumTarihi': dogumTarihi.millisecondsSinceEpoch,
      'cinsiyet': cinsiyet,
      'epostaAdresi': epostaAdresi,
      'egitimDurumu': egitimDurumu,
      'hobiler': hobiler,
    };
  }

  factory Kullanici.fromMap(Map<String, dynamic> map) {
    return Kullanici(
        ad: map['ad'] as String,
        soyad: map['soyad'] as String,
        dogumTarihi:
            DateTime.fromMillisecondsSinceEpoch(map['dogumTarihi'] as int),
        cinsiyet: map['cinsiyet'] as String,
        epostaAdresi: map['epostaAdresi'] as String,
        egitimDurumu: map['egitimDurumu'] as String,
        hobiler: List<String>.from(
          (map['hobiler'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Kullanici.fromJson(String source) =>
      Kullanici.fromMap(json.decode(source) as Map<String, dynamic>);
}
