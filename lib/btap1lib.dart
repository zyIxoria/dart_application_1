import 'dart:io';

void tinhtienkem() {
  print("Nhập số lượng que kem (>0): ");
  int soLuong = int.parse(stdin.readLineSync()!);

  print("Nhập giá tiền cho một que kem: ");
  double giaMotQue = double.parse(stdin.readLineSync()!);

  double tongTien = soLuong * giaMotQue;

  if (soLuong > 10) {
    tongTien *= 0.9; // giảm 10%
  } else if (soLuong >= 5 && soLuong <= 10) {
    tongTien *= 0.95; // giảm 5%
  }

  print("Số tiền phải trả: $tongTien");
}
