import 'dart:io';

void xulysonguyenduong() {
  int n;

  while (true) {
    print("Nhập một số nguyên dương > 10: ");
    String? input = stdin.readLineSync();
    int? temp = int.tryParse(input ?? '');

    if (temp == null) {
      print("Vui lòng nhập số nguyên!");
    } else if (temp <= 10) {
      print("Số phải lớn hơn 10!");
    } else {
      n = temp;
      break;
    }
  }

  // a. Đếm số chữ số
  int soChuSo = n.toString().length;
  print("Số có $soChuSo chữ số");

  // b. Tổng chữ số
  int tongChuSo = n.toString().split('').map(int.parse).reduce((a, b) => a + b);
  print("Tổng các chữ số: $tongChuSo");

  // c. Kiểm tra chữ số lẻ
  bool coSoLe = n.toString().split('').map(int.parse).any((d) => d % 2 != 0);

  if (coSoLe) {
    print("Số nhập vào có chứa chữ số lẻ");
  } else {
    print("Số nhập vào không chứa chữ số lẻ");
  }
}
