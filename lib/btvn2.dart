import 'dart:io';

void xulychuoi() {
  print("Nhập một chuỗi: ");
  String s = stdin.readLineSync()!;

  // a. Xuất chuỗi
  print("Chuỗi vừa nhập: $s");

  // b. Đếm nguyên âm
  int nguyenAm = s
      .toLowerCase()
      .split('')
      .where(
        (c) =>
            ['a', 'e', 'i', 'o', 'u', 'ă', 'â', 'ê', 'ô', 'ơ', 'ư'].contains(c),
      )
      .length;
  print("Số kí tự nguyên âm: $nguyenAm");

  // c. Đếm số từ
  int soTu = s.trim().split(RegExp(r'\s+')).length;
  print("Số từ trong chuỗi: $soTu");

  // d. Kiểm tra đối xứng
  String daoNguoc = s.split('').reversed.join('');
  bool doiXung = s == daoNguoc;
  print("Chuỗi ${doiXung ? 'là' : 'không là'} chuỗi đối xứng");

  // e. Đảo ngược từ
  List<String> tu = s.trim().split(RegExp(r'\s+'));
  String daoTu = tu.reversed.join(' ');
  print("Chuỗi đảo ngược từ: $daoTu");
}
