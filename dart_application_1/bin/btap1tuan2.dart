import 'dart:io';

import 'package:dart_application_1/dart_application_1.dart';
import 'package:dart_application_1/PhongLoaiA.dart';
import 'package:dart_application_1/PhongLoaiB.dart';

void main() {
  List<Phong> danhSachPhong = [];

  // 1. Đọc nội dung file (Giả định file phongthue.txt nằm cùng thư mục)
  try {
    File file = File('phongthue.txt');
    List<String> lines = file.readAsLinesSync();

    for (var line in lines) {
      var data = line.split('#');
      String ma = data[0];
      int nguoi = int.parse(data[1]);
      int dien = int.parse(data[2]);
      int nuoc = int.parse(data[3]);

      if (ma.startsWith('A')) {
        int nguoiThan = int.parse(data[4]);
        danhSachPhong.add(PhongLoaiA(ma, nguoi, dien, nuoc, nguoiThan));
      } else if (ma.startsWith('B')) {
        int giat = int.parse(data[4]);
        int may = int.parse(data[5]);
        danhSachPhong.add(PhongLoaiB(ma, nguoi, dien, nuoc, giat, may));
      }
    }
  } catch (e) {
    print("Lỗi đọc file: $e");
    return;
  }

  print("-" * 30);
  // 2. In ra màn hình thông tin các phòng
  print("DANH SÁCH TẤT CẢ PHÒNG:");
  danhSachPhong.forEach((p) => print(p));

  print("-" * 30);
  // 3. In danh sách phòng có số người > 2
  print("PHÒNG CÓ TRÊN 2 NGƯỜI:");
  danhSachPhong.where((p) => p.soNguoi > 2).forEach((p) => print(p));

  print("-" * 30);
  // 4. Tính tổng tiền phòng
  double tongTien = danhSachPhong.fold(0, (sum, p) => sum + p.tinhTien());
  print("TỔNG TIỀN PHÒNG THU ĐƯỢC: $tongTien");

  print("-" * 30);
  // 5. Sắp xếp danh sách giảm dần theo số điện
  // Sử dụng công thức: (b - a) cho giảm dần
  danhSachPhong.sort((a, b) => b.soDien.compareTo(a.soDien));
  print("DANH SÁCH SAU KHI SẮP XẾP (ĐIỆN GIẢM DẦN):");
  danhSachPhong.forEach((p) => print(p));

  print("-" * 30);
  // 6. In ra màn hình danh sách các phòng loại A
  print("DANH SÁCH PHÒNG LOẠI A:");
  danhSachPhong.whereType<PhongLoaiA>().forEach((p) => print(p));
}
