import 'package:dart_application_1/MonHoc.dart';

class DoAn extends MonHoc {
  double diemGVHD;
  double diemGVPB;

  DoAn(String ma, String ten, int tc, this.diemGVHD, this.diemGVPB)
    : super(ma, ten, tc);

  @override
  double tinhDTB() => (diemGVHD + diemGVPB) / 2;
}
