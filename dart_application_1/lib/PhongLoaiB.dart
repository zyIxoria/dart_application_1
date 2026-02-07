import 'package:dart_application_1/dart_application_1.dart';

class PhongLoaiB extends Phong {
  int giatUi;
  int soMay;

  PhongLoaiB(String ma, int nguoi, int dien, int nuoc, this.giatUi, this.soMay)
    : super(ma, nguoi, dien, nuoc);

  @override
  double tinhTien() {
    return 2000 + 2 * soDien + 8 * soNuoc + giatUi * 5 + soMay * 100;
  }

  @override
  String toString() =>
      '${super.toString()}, Giặt: $giatUi, Máy: $soMay | Tiền: ${tinhTien()}';
}
