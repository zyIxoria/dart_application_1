import 'dart:io';
import 'package:dart_application_1/MonHoc.dart';
import 'package:dart_application_1/LyThuyet.dart';
import 'package:dart_application_1/ThucHanh.dart';
import 'package:dart_application_1/DoAn.dart';
import 'package:dart_application_1/docFileMonHoc.dart';

void main() {
  List<MonHoc> danhSach = [];
  docFile(danhSach); // đọc file vào danh sách

  print('--- DANH SÁCH ĐỌC TỪ FILE ---');
  danhSach.forEach(print);
  // 1. Nhập danh sách môn học
  danhSach.add(LyThuyet('LT01', 'CTRR', 3, 8, 9));
  danhSach.add(ThucHanh('TH01', 'LapTrinh', 4, [7, 8, 9]));
  danhSach.add(DoAn('DA01', 'DoAn1', 5, 8, 9));
  danhSach.add(LyThuyet('LT02', 'OOP', 3, 7, 8));
  danhSach.add(ThucHanh('TH02', 'CSDL', 4, [6, 7, 8]));

  // 2. Xuất danh sách
  print('--- DANH SÁCH MÔN HỌC ---');
  danhSach.forEach(print);

  // 3. Kiểm tra sắp xếp theo tên
  bool sortedByName = true;
  for (int i = 0; i < danhSach.length - 1; i++) {
    if (danhSach[i].tenMon.compareTo(danhSach[i + 1].tenMon) > 0) {
      sortedByName = false;
      break;
    }
  }
  print('\nDanh sách có sắp xếp theo tên? ${sortedByName ? "Có" : "Không"}');

  // 4. Sắp xếp theo số tín chỉ
  if (danhSach.isNotEmpty) {
    danhSach.sort((a, b) => a.soTinChi.compareTo(b.soTinChi));
    print('--- Danh sách sau khi sắp xếp theo Tín chỉ ---');
    danhSach.forEach(print);
  } else {
    print('Danh sách trống, không thể sắp xếp theo Tín chỉ');
  }

  // 5. Môn có số tín chỉ cao nhất
  if (danhSach.isNotEmpty) {
    var maxTinChi = danhSach.reduce((a, b) => a.soTinChi > b.soTinChi ? a : b);
    print('\n--- MÔN CÓ TÍN CHỈ CAO NHẤT (${maxTinChi.soTinChi} TC) ---');
    danhSach.where((m) => m.soTinChi == maxTinChi.soTinChi).forEach(print);
  }

  // 6. Tìm kiếm theo tên
  print('\nNhập tên môn cần tìm:');
  String? ten = stdin.readLineSync();
  var kq = danhSach.where((m) => m.tenMon.toLowerCase() == ten?.toLowerCase());

  if (kq.isNotEmpty) {
    print('Tìm thấy: ${kq.first}');
  } else {
    print('Không tìm thấy, đã thêm môn mới (giả lập)');
    danhSach.add(LyThuyet('NEW', ten ?? 'Unknown', 2, 0, 0));
  }

  // 7. Tính số tín chỉ trung bình
  double avgTC =
      danhSach.map((m) => m.soTinChi).reduce((a, b) => a + b) / danhSach.length;
  print('\nSố tín chỉ trung bình: ${avgTC.toStringAsFixed(2)}');
}
