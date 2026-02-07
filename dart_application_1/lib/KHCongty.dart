import 'dart:io';
import 'HoaDon.dart';
// 3. Khách hàng công ty

class KHCongTy extends HoaDon {
  int soNhanVien = 0;

  @override
  double tinhChietKhau() {
    double tile = 0;
    if (soNhanVien > 5000)
      tile = 0.07;
    else if (soNhanVien > 1000)
      tile = 0.05;
    return (soLuong * giaBan) * tile;
  }

  @override
  double tinhTroGia() => 120000.0 * soLuong;

  @override
  void nhapThongTin() {
    super.nhapThongTin();
    stdout.write("Nhập số lượng nhân viên: ");
    soNhanVien = int.parse(stdin.readLineSync()!);
  }
}
