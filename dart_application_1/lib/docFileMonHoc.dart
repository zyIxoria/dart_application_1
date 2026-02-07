import 'dart:io';
import 'package:dart_application_1/MonHoc.dart';
import 'package:dart_application_1/LyThuyet.dart';
import 'package:dart_application_1/ThucHanh.dart';
import 'package:dart_application_1/DoAn.dart';

void docFile(List<MonHoc> danhSach) {
  final file = File('../monhoc.txt');

  if (!file.existsSync()) {
    print('File không tồn tại');
    return;
  }

  List<String> lines = file.readAsLinesSync();

  for (var line in lines) {
    var d = line.split('#');

    switch (d[0]) {
      case 'LT':
        danhSach.add(
          LyThuyet(
            d[1],
            d[2],
            int.parse(d[3]),
            double.parse(d[4]),
            double.parse(d[5]),
          ),
        );
        break;

      case 'TH':
        danhSach.add(
          ThucHanh(d[1], d[2], int.parse(d[3]), [
            double.parse(d[4]),
            double.parse(d[5]),
            double.parse(d[6]),
          ]),
        );
        break;

      case 'DA':
        danhSach.add(
          DoAn(
            d[1],
            d[2],
            int.parse(d[3]),
            double.parse(d[4]),
            double.parse(d[5]),
          ),
        );
        break;
    }
  }
}
