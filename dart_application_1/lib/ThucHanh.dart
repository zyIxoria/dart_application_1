// Môn Thực hành: Trung bình cộng các bài kiểm tra
import 'package:dart_application_1/MonHoc.dart';

class ThucHanh extends MonHoc {
  List<double> diemKT;

  ThucHanh(String ma, String ten, int tc, this.diemKT) : super(ma, ten, tc);

  @override
  double tinhDTB() => diemKT.reduce((a, b) => a + b) / diemKT.length;
}
