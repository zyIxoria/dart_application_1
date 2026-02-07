import 'dart:io';
import 'HoaDon.dart';

// 2. Đại lý cấp 1
class DaiLyCap1 extends HoaDon {
  int thoiGianHopTac = 0;

  @override
  double tinhChietKhau() {
    double tile = 0.3;
    if (thoiGianHopTac > 5) {
      tile += (thoiGianHopTac * 0.01);
      if (tile > 0.35) tile = 0.35;
    }
    return (soLuong * giaBan) * tile;
  }

  @override
  void nhapThongTin() {
    super.nhapThongTin();
    stdout.write("Nhập số năm hợp tác: ");
    thoiGianHopTac = int.parse(stdin.readLineSync()!);
  }
}
