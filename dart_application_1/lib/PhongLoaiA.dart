import 'package:dart_application_1/dart_application_1.dart';

class PhongLoaiA extends Phong {
  int soNguoiThan;

  PhongLoaiA(String ma, int nguoi, int dien, int nuoc, this.soNguoiThan)
    : super(ma, nguoi, dien, nuoc);

  @override
  double tinhTien() {
    return (1400 + 2 * soDien + 8 * soNuoc + 50 * soNguoiThan).toDouble();
  }

  @override
  String toString() =>
      '${super.toString()}, Người thân: $soNguoiThan | Tiền: ${tinhTien()}';
}
