import 'dart:io';

void xulysonguyenduong() {
  print("Nhập một số nguyên dương > 10: ");
  int n = int.parse(stdin.readLineSync()!);

  // a. Đếm số chữ số
  int soChuSo = n.toString().length;
  print("Số có $soChuSo chữ số");

  // b. Tính tổng các chữ số
  int tongChuSo = n.toString().split('').map(int.parse).reduce((a, b) => a + b);
  print("Tổng các chữ số: $tongChuSo");

  // c. Kiểm tra có chữ số lẻ hay không
  bool coSoLe = n
      .toString()
      .split('')
      .map(int.parse)
      .any((digit) => digit % 2 != 0);
  if (coSoLe) {
    print("Số nhập vào có chứa chữ số lẻ");
  } else {
    print("Số nhập vào không chứa chữ số lẻ");
  }
}
