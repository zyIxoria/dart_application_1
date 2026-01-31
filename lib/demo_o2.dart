import 'dart:io';

bool checkPrime(int x) {
  if (x < 2) return false;
  for (int k = 2; k < x; k++) {
    if (x % k == 0) return false;
  }
  return true;
}

void demo02() {
  stdout.write("Nhap mot so nguyen: ");
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty) {
    print("Ban da nhap: $input");
    int number = int.parse(input);
    if (checkPrime(number)) {
      print("$number la so nguyen to");
    } else {
      print("$number khong la so nguyen to");
    }
  } else {
    print("Khong co du lieu nhap vao");
  }
}
