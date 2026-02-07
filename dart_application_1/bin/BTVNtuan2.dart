import 'dart:io';
import 'package:dart_application_1/QuanLiHoaDon.dart';

void main() {
  QuanLyHoaDon ql = QuanLyHoaDon();
  ql.nhapDanhSach();

  print("\n--- DANH SÁCH HÓA ĐƠN ---");
  ql.xuatDanhSach();

  print("\nTổng tiền công ty đã hỗ trợ trợ giá: ${ql.tinhTongTroGia()}");
  print("Tổng chiết khấu cho KH Công ty: ${ql.tongChietKhauKHCongTy()}");

  ql.khachHangMuaNhieuNhat();

  ql.sapXepDanhSach();
  print("\n--- DANH SÁCH SAU KHI SẮP XẾP ---");
  ql.xuatDanhSach();

  stdout.write("\nNhập mã khách hàng cần tìm: ");
  String maTim = stdin.readLineSync()!;
  ql.timKiemTheoMa(maTim);
}
