import 'dart:io';

bool laSoNguyenTo(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

void danhsachsonguyen() {
  print("Nhập danh sách số nguyên, cách nhau bởi dấu cách: ");
  List<int> ds = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  // a. Xuất danh sách
  print("Danh sách vừa nhập: $ds");

  // b. Tính tổng
  int tong = ds.reduce((a, b) => a + b);
  print("Tổng các phần tử: $tong");

  // c. Xuất số nguyên tố
  List<int> nguyenTo = ds.where((x) => laSoNguyenTo(x)).toList();
  print("Các số nguyên tố trong danh sách: $nguyenTo");

  // d. Kiểm tra giá trị bất kỳ
  print("Nhập một giá trị bất kỳ: ");
  int value = int.parse(stdin.readLineSync()!);

  if (ds.contains(value)) {
    int viTri = ds.indexOf(value);
    print("Giá trị $value có trong danh sách tại vị trí $viTri");
  } else {
    ds.insert(0, value);
    print("Giá trị $value không có trong danh sách. Đã thêm vào đầu: $ds");
  }
}
