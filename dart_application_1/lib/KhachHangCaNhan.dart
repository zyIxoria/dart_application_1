import 'dart:io';
import 'HoaDon.dart';

// 1. Khách hàng cá nhân
class KHCaNhan extends HoaDon {
  double khoangCach = 0;

  KHCaNhan();
  KHCaNhan.full(String ma, String ten, int sl, double gia, this.khoangCach)
    : super.full(ma, ten, sl, gia);

  @override
  double tinhChietKhau() {
    double ck = (soLuong < 3) ? 0 : (soLuong * giaBan * 0.05);
    if (khoangCach < 10) ck += (50000 * soLuong);
    return ck;
  }

  @override
  double tinhTroGia() {
    double tg = (0.02 * giaBan) * soLuong;
    if (soLuong > 2) tg += 100000;
    return tg;
  }

  @override
  void nhapThongTin() {
    super.nhapThongTin();
    stdout.write("Nhập khoảng cách giao hàng (km): ");
    khoangCach = double.parse(stdin.readLineSync()!);
  }
}
