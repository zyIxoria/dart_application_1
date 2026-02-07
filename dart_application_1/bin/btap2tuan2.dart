import 'dart:io';
import 'package:dart_application_1/MonHoc.dart';
import 'package:dart_application_1/LyThuyet.dart';
import 'package:dart_application_1/ThucHanh.dart';
import 'package:dart_application_1/DoAn.dart';

void main() {
  List<MonHoc> danhSach = [];

  // Giả lập đọc file monhoc.txt (Yêu cầu cuối)
  // Định dạng file: Loai#Ma#Ten#TC#Diem1#Diem2...
  void docFile() {
    try {
      final file = File('monhoc.txt');
      if (!file.existsSync()) return;
      List<String> lines = file.readAsLinesSync();
      for (var line in lines) {
        var d = line.split('#');
        if (d[0] == 'LT') {
          danhSach.add(
            LyThuyet(
              d[1],
              d[2],
              int.parse(d[3]),
              double.parse(d[4]),
              double.parse(d[5]),
            ),
          );
        }
        if (d[0] == 'TH') {
          danhSach.add(
            ThucHanh(d[1], d[2], int.parse(d[3]), [
              double.parse(d[4]),
              double.parse(d[5]),
              double.parse(d[6]),
            ]),
          );
        }
        if (d[0] == 'DA') {
          danhSach.add(
            DoAn(
              d[1],
              d[2],
              int.parse(d[3]),
              double.parse(d[4]),
              double.parse(d[5]),
            ),
          );
        }
      }
    } catch (e) {
      print("Lỗi file: $e");
    }
  }

  docFile();

  // 1. Kiểm tra danh sách có sắp xếp tăng dần theo tên không?
  bool isSortedByName = true;
  for (int i = 0; i < danhSach.length - 1; i++) {
    if (danhSach[i].tenMon.compareTo(danhSach[i + 1].tenMon) > 0) {
      isSortedByName = false;
      break;
    }
  }
  print("Danh sách có sắp xếp theo tên? ${isSortedByName ? "Có" : "Không"}");

  // 2. Sắp xếp danh sách tăng dần theo số tín chỉ
  danhSach.sort((a, b) => a.soTinChi.compareTo(b.soTinChi));
  print("\n--- Danh sách sau khi sắp xếp theo Tín chỉ ---");
  danhSach.forEach(print);

  // 3. Tìm môn học có số tín chỉ cao nhất
  int maxTC = danhSach.map((m) => m.soTinChi).reduce((a, b) => a > b ? a : b);
  print("\n--- Môn học có số tín chỉ cao nhất ($maxTC TC) ---");
  danhSach.where((m) => m.soTinChi == maxTC).forEach(print);

  // 4. Tìm kiếm hoặc thêm môn học
  print("\nNhập tên môn học cần tìm:");
  String? searchName = stdin.readLineSync();
  var found = danhSach.where(
    (m) => m.tenMon.toLowerCase() == searchName?.toLowerCase(),
  );

  if (found.isNotEmpty) {
    print("Thông tin môn học: ${found.first}");
  } else {
    print("Không thấy, đã thêm tên vào cuối danh sách (giả lập)");
    // Code thêm mới tùy loại sẽ thực hiện ở đây
  }

  // 5. Tính số tín chỉ trung bình
  double avgTC =
      danhSach.map((m) => m.soTinChi).reduce((a, b) => a + b) / danhSach.length;
  print("\nSố tín chỉ trung bình: ${avgTC.toStringAsFixed(2)}");
}
