import 'dart:io';

abstract class MonHoc {
  String maMon;
  String tenMon;
  int soTinChi;

  MonHoc(this.maMon, this.tenMon, this.soTinChi);

  // Phương thức trừu tượng tính DTB theo từng loại
  double tinhDTB();

  // Quy đổi điểm sang hệ chữ (Điểm hệ 4)
  String quyDoiDiemChu() {
    double dtb = tinhDTB();
    if (dtb >= 8.5) return 'A';
    if (dtb >= 7.0) return 'B';
    if (dtb >= 5.5) return 'C';
    if (dtb >= 4.0) return 'D';
    return 'F';
  }

  @override
  String toString() {
    return '[$maMon] $tenMon ($soTinChi TC) - DTB: ${tinhDTB().toStringAsFixed(2)} - Hệ chữ: ${quyDoiDiemChu()}';
  }
}
