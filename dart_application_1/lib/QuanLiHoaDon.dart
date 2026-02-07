import 'dart:io';
import 'HoaDon.dart';
import 'DaiLyCap1.dart';
import 'KHCongty.dart';
import 'KhachHangCaNhan.dart';

class QuanLyHoaDon {
  List<HoaDon> danhSach = [];

  void nhapDanhSach() {
    print("Nhập số lượng hóa đơn: ");
    int n = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < n; i++) {
      print("Chọn loại KH (1: Cá nhân, 2: Đại lý, 3: Công ty): ");
      int loai = int.parse(stdin.readLineSync()!);
      HoaDon? hd;
      if (loai == 1)
        hd = KHCaNhan();
      else if (loai == 2)
        hd = DaiLyCap1();
      else
        hd = KHCongTy();

      try {
        hd.nhapThongTin();
        danhSach.add(hd);
      } catch (e) {
        print("Lỗi: $e. Bỏ qua hóa đơn này.");
      }
    }
  }

  void xuatDanhSach() => danhSach.forEach((hd) => hd.xuatThongTin());

  double tinhTongThanhTien() =>
      danhSach.fold(0, (sum, hd) => sum + hd.tinhThanhTien());

  double tinhTongTroGia() =>
      danhSach.fold(0, (sum, hd) => sum + hd.tinhTroGia());

  void khachHangMuaNhieuNhat() {
    if (danhSach.isEmpty) return;
    int maxSL = danhSach.map((e) => e.soLuong).reduce((a, b) => a > b ? a : b);
    print("KH có số lượng mua nhiều nhất ($maxSL):");
    danhSach
        .where((hd) => hd.soLuong == maxSL)
        .forEach((hd) => print(hd.tenKH));
  }

  double tongChietKhauKHCongTy() {
    return danhSach.whereType<KHCongTy>().fold(
      0,
      (sum, hd) => sum + hd.tinhChietKhau(),
    );
  }

  void sapXepDanhSach() {
    danhSach.sort((a, b) {
      int cmp = a.soLuong.compareTo(b.soLuong);
      if (cmp == 0) return b.tinhThanhTien().compareTo(a.tinhThanhTien());
      return cmp;
    });
  }

  void timKiemTheoMa(String ma) {
    var results = danhSach.where((hd) => hd.maKH == ma);
    if (results.isEmpty)
      print("Khách hàng lạ");
    else
      results.forEach((hd) => hd.xuatThongTin());
  }
}
