// Môn Lý thuyết: DTB = Tiểu luận*0.3 + Cuối kỳ*0.7
import 'package:dart_application_1/MonHoc.dart';

class LyThuyet extends MonHoc {
  double diemTieuLuan;
  double diemCuoiKy;

  LyThuyet(String ma, String ten, int tc, this.diemTieuLuan, this.diemCuoiKy)
    : super(ma, ten, tc);

  @override
  double tinhDTB() => diemTieuLuan * 0.3 + diemCuoiKy * 0.7;
}
