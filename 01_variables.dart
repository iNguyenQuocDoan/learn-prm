// ============================================================
// DART - BIẾN VÀ KIỂU DỮ LIỆU CƠ BẢN
// ============================================================
//
// Dart là ngôn ngữ strongly-typed: mỗi biến có kiểu xác định.
// Có 2 cách khai báo biến:
//   1. Dùng `var`  → Dart tự suy ra kiểu từ giá trị gán
//   2. Ghi rõ kiểu → tường minh, dễ đọc hơn với người mới

void main() {
  // ----------------------------------------------------------
  // 1. var — Dart tự xác định kiểu (type inference)
  // ----------------------------------------------------------
  var name = 'Doan';   // Dart biết đây là String
  var age  = 20;       // Dart biết đây là int

  print('name = $name');  // name = Doan
  print('age  = $age');   // age  = 20

  // ----------------------------------------------------------
  // 2. Khai báo tường minh — ghi rõ kiểu dữ liệu
  // ----------------------------------------------------------
  String name1 = 'Doan';   // chỉ chứa chuỗi
  int    age1  = 20;        // chỉ chứa số nguyên
  double height = 1.75;     // số thực (có phần thập phân)

  print('name1  = $name1');
  print('age1   = $age1');
  print('height = $height');

  // ----------------------------------------------------------
  // 3. String — chuỗi ký tự
  // ----------------------------------------------------------
  String greeting = 'Xin chào, $name1!';   // nội suy biến bằng $
  String info     = 'Tuổi: ${age1 + 1}';   // biểu thức phức tạp dùng ${}

  print(greeting);   // Xin chào, Doan!
  print(info);       // Tuổi: 21

  // ----------------------------------------------------------
  // 4. int — số nguyên
  // ----------------------------------------------------------
  int a = 10;
  int b = 3;

  print('$a + $b = ${a + b}');   // 13
  print('$a ~/ $b = ${a ~/ b}'); // 3  (chia nguyên)
  print('$a % $b  = ${a % b}');  // 1  (số dư)

  // ----------------------------------------------------------
  // 5. double — số thực
  // ----------------------------------------------------------
  double pi   = 3.14159;
  double area = pi * 5 * 5;   // diện tích hình tròn bán kính 5

  print('pi   = $pi');
  print('area = $area');

  // ----------------------------------------------------------
  // TỔNG KẾT
  // ----------------------------------------------------------
  // var      → Dart tự suy kiểu, tiện khi kiểu rõ ràng từ giá trị
  // String   → chuỗi ký tự, dùng '' hoặc ""
  // int      → số nguyên, không có phần thập phân
  // double   → số thực, có phần thập phân
  // Nên dùng tường minh khi cần rõ ràng, dùng var khi kiểu hiển nhiên
}
