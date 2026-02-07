import 'dart:io';

abstract class HoaDon {
  String _maKH = "";
  String _tenKH = "";
  int _soLuong = 0;
  double _giaBan = 0;

  // Constructor mặc định
  HoaDon();

  // Constructor đầy đủ tham số
  HoaDon.full(this._maKH, this._tenKH, this._soLuong, this._giaBan);

  // Getter & Setter với kiểm tra điều kiện (Yêu cầu 1)
  set maKH(String value) {
    RegExp reg = RegExp(r'^KH\d{4}$');
    if (reg.hasMatch(value))
      _maKH = value;
    else
      throw Exception("Mã KH sai định dạng (KHxxxx)!");
  }

  set tenKH(String value) => value.isNotEmpty
      ? _tenKH = value
      : throw Exception("Tên không được trống!");
  set soLuong(int value) =>
      value > 0 ? _soLuong = value : throw Exception("Số lượng phải > 0!");
  set giaBan(double value) =>
      value > 0 ? _giaBan = value : throw Exception("Giá bán phải > 0!");

  String get maKH => _maKH;
  String get tenKH => _tenKH;
  int get soLuong => _soLuong;
  double get giaBan => _giaBan;

  // Các phương thức tính toán trừu tượng
  double tinhChietKhau();
  double tinhTroGia() => 0; // Mặc định không có trợ giá

  double tinhThanhTien() {
    double vat = _soLuong * _giaBan * 0.1;
    return (_soLuong * _giaBan) - tinhChietKhau() + vat - tinhTroGia();
  }

  void nhapThongTin() {
    stdout.write("Nhập mã KH (KHxxxx): ");
    maKH = stdin.readLineSync()!;
    stdout.write("Nhập tên KH: ");
    tenKH = stdin.readLineSync()!;
    stdout.write("Nhập số lượng: ");
    soLuong = int.parse(stdin.readLineSync()!);
    stdout.write("Nhập giá bán: ");
    giaBan = double.parse(stdin.readLineSync()!);
  }

  void xuatThongTin() {
    print("Mã: $_maKH | Tên: $_tenKH | SL: $_soLuong | Giá: $_giaBan");
    print(
      "Chiết khấu: ${tinhChietKhau()} | Trợ giá: ${tinhTroGia()} | Thành tiền: ${tinhThanhTien()}",
    );
  }
}
