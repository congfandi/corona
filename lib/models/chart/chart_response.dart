/*
 * corona
 * chart_response.dart
 * Created by Cong Fandi on 3/4/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

class ChartResponse {
  List<Features> features;

  ChartResponse({this.features});

  ChartResponse.fromJson(Map<String, dynamic> json) {
    if (json['features'] != null) {
      features = new List<Features>();
      json['features'].forEach((v) {
        features.add(new Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.features != null) {
      data['features'] = this.features.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Features {
  Chart chart;

  Features({this.chart});

  Features.fromJson(Map<String, dynamic> json) {
    chart = json['attributes'] != null
        ? new Chart.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chart != null) {
      data['attributes'] = this.chart.toJson();
    }
    return data;
  }
}

class Chart {
  int hariKe;
  int tanggal;
  int jumlahKasusBaruPerHari;
  int jumlahKasusKumulatif;
  int jumlahPasienDalamPerawatan;
  int persentasePasienDalamPerawatan;
  int jumlahPasienSembuh;
  int persentasePasienSembuh;
  int jumlahPasienMeninggal;
  int persentasePasienMeninggal;
  int jumlahKasusSembuhPerHari;
  int jumlahKasusMeninggalPerHari;
  int jumlahKasusDirawatPerHari;
  int fID;

  Chart(
      {this.hariKe,
      this.tanggal,
      this.jumlahKasusBaruPerHari,
      this.jumlahKasusKumulatif,
      this.jumlahPasienDalamPerawatan,
      this.persentasePasienDalamPerawatan,
      this.jumlahPasienSembuh,
      this.persentasePasienSembuh,
      this.jumlahPasienMeninggal,
      this.persentasePasienMeninggal,
      this.jumlahKasusSembuhPerHari,
      this.jumlahKasusMeninggalPerHari,
      this.jumlahKasusDirawatPerHari,
      this.fID});

  Chart.fromJson(Map<String, dynamic> json) {
    hariKe = json['Hari_ke'];
    tanggal = json['Tanggal'];
    jumlahKasusBaruPerHari = json['Jumlah_Kasus_Baru_per_Hari'];
    jumlahKasusKumulatif = json['Jumlah_Kasus_Kumulatif'];
    jumlahPasienDalamPerawatan = json['Jumlah_pasien_dalam_perawatan'];
    persentasePasienDalamPerawatan = json['Persentase_Pasien_dalam_Perawatan'];
    jumlahPasienSembuh = json['Jumlah_Pasien_Sembuh'];
    persentasePasienSembuh = json['Persentase_Pasien_Sembuh'];
    jumlahPasienMeninggal = json['Jumlah_Pasien_Meninggal'];
    persentasePasienMeninggal = json['Persentase_Pasien_Meninggal'];
    jumlahKasusSembuhPerHari = json['Jumlah_Kasus_Sembuh_per_Hari'];
    jumlahKasusMeninggalPerHari = json['Jumlah_Kasus_Meninggal_per_Hari'];
    jumlahKasusDirawatPerHari = json['Jumlah_Kasus_Dirawat_per_Hari'];
    fID = json['FID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Hari_ke'] = this.hariKe;
    data['Tanggal'] = this.tanggal;
    data['Jumlah_Kasus_Baru_per_Hari'] = this.jumlahKasusBaruPerHari;
    data['Jumlah_Kasus_Kumulatif'] = this.jumlahKasusKumulatif;
    data['Jumlah_pasien_dalam_perawatan'] = this.jumlahPasienDalamPerawatan;
    data['Persentase_Pasien_dalam_Perawatan'] =
        this.persentasePasienDalamPerawatan;
    data['Jumlah_Pasien_Sembuh'] = this.jumlahPasienSembuh;
    data['Persentase_Pasien_Sembuh'] = this.persentasePasienSembuh;
    data['Jumlah_Pasien_Meninggal'] = this.jumlahPasienMeninggal;
    data['Persentase_Pasien_Meninggal'] = this.persentasePasienMeninggal;
    data['Jumlah_Kasus_Sembuh_per_Hari'] = this.jumlahKasusSembuhPerHari;
    data['Jumlah_Kasus_Meninggal_per_Hari'] = this.jumlahKasusMeninggalPerHari;
    data['Jumlah_Kasus_Dirawat_per_Hari'] = this.jumlahKasusDirawatPerHari;
    data['FID'] = this.fID;
    return data;
  }
}
