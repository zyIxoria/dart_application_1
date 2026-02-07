import 'dart:io';

abstract class Phong {
  String maSo;
  int soNguoi;
  int soDien;
  int soNuoc;

  Phong(this.maSo, this.soNguoi, this.soDien, this.soNuoc);

  // Phương thức trừu tượng để tính tiền
  double tinhTien();

  @override
  String toString() {
    return 'Mã: $maSo, Người: $soNguoi, Điện: $soDien, Nước: $soNuoc';
  }
}
