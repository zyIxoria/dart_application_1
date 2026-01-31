import 'dart:io';

import 'package:dart_application_1/btap1lib.dart';
import 'package:dart_application_1/btap2.dart';
import 'package:dart_application_1/btap3.dart';
import 'package:dart_application_1/btvn1.dart';
import 'package:dart_application_1/btvn2.dart';

void main() {
  int luaChon;
  do {
    print("=== MENU BÀI TẬP ===");
    print("1. Tính tiền mua kem");
    print("2. Kiểm tra số nguyên");
    print("3. Làm việc với danh sách");
    print("4. Danh sách số ngẫu nhiên");
    print("5. Xử lý chuỗi");

    print("Nhập lựa chọn của bạn (1-5): ");

    luaChon = int.parse(stdin.readLineSync()!);

    switch (luaChon) {
      case 1:
        tinhtienkem();
        break;
      case 2:
        xulysonguyenduong();
        break;
      case 3:
        danhsachsonguyen();
        break;
      case 4:
        dsachsonguyenngaunhien();
        break;
      case 5:
        xulychuoi();
        break;
      case 0:
        print("Thoát chương trình. Tạm biệt!");
        break;
      default:
        print("Lựa chọn không hợp lệ. Vui lòng chọn từ 1 đến 5.");
    }
  } while (luaChon != 0);
}
