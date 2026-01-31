import 'dart:io';
import 'dart:math';

void dsachsonguyenngaunhien() {
  Random rand = Random();

  // Tạo danh sách ngẫu nhiên với 10 phần tử từ 5 đến 100
  List<int> ds = List.generate(10, (_) => 5 + rand.nextInt(96));

  // a. Xuất danh sách
  print("Danh sách vừa tạo: $ds");

  // b. Trung bình cộng số lẻ
  List<int> soLe = ds.where((x) => x % 2 != 0).toList();
  if (soLe.isEmpty) {
    print("Danh sách không có số lẻ");
  } else {
    double tbLe = soLe.reduce((a, b) => a + b) / soLe.length;
    print("Trung bình cộng các số lẻ: $tbLe");
  }

  // c. Kiểm tra đối xứng
  bool doiXung = ds.join(',') == ds.reversed.join(',');
  print("Danh sách ${doiXung ? 'là' : 'không là'} danh sách đối xứng");

  // d. Kiểm tra sắp xếp tăng dần
  bool tangDan = true;
  for (int i = 0; i < ds.length - 1; i++) {
    if (ds[i] > ds[i + 1]) {
      tangDan = false;
      break;
    }
  }
  print("Danh sách ${tangDan ? 'được' : 'không được'} sắp xếp tăng dần");

  // e. Phần tử lớn nhất
  int maxValue = ds.reduce(max);
  print("Phần tử lớn nhất: $maxValue");

  // f. Số chẵn lớn nhất
  List<int> soChan = ds.where((x) => x % 2 == 0).toList();
  if (soChan.isEmpty) {
    print("Danh sách không có số chẵn");
  } else {
    int maxChan = soChan.reduce(max);
    print("Số chẵn lớn nhất: $maxChan");
  }

  // g. Nhập giá trị và xử lý
  print("Nhập một giá trị bất kỳ: ");
  int value = int.parse(stdin.readLineSync()!);

  if (ds.contains(value)) {
    ds.removeWhere((x) => x == value);
    print("Đã xóa tất cả phần tử có giá trị $value. Danh sách mới: $ds");
  } else {
    print("Không tìm thấy");
  }
}
