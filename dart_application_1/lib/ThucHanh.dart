// Môn Thực hành: Trung bình cộng các bài kiểm tra
import 'package:dart_application_1/MonHoc.dart';

class ThucHanh extends MonHoc {
  List<double> diemKiemTra;
  ThucHanh(String ma, String ten, int tc, this.diemKiemTra)
    : super(ma, ten, tc);

  @override
  double tinhDTB() => diemKiemTra.reduce((a, b) => a + b) / diemKiemTra.length;
}
