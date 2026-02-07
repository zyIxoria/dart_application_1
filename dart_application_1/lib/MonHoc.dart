import 'dart:io';

abstract class MonHoc {
  String maMon;
  String tenMon;
  int soTinChi;

  MonHoc(this.maMon, this.tenMon, this.soTinChi);

  double tinhDTB();

  String quyDoiHe4() {
    double dtb = tinhDTB();
    if (dtb >= 8.5) return 'A';
    if (dtb >= 7.0) return 'B';
    if (dtb >= 5.5) return 'C';
    if (dtb >= 4.0) return 'D';
    return 'F';
  }

  @override
  String toString() {
    return '[$maMon] $tenMon | TC: $soTinChi | DTB: ${tinhDTB().toStringAsFixed(2)} | Hệ 4: ${quyDoiHe4()}';
  }
}
