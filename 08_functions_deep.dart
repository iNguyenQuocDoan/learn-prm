// ============================================================
// DART - FUNCTION CHI TIẾT: TỪ CƠ BẢN ĐẾN NÂNG CAO
// ============================================================

// ----------------------------------------------------------
// 1. Hàm cơ bản — void (không trả giá trị)
// ----------------------------------------------------------
void sayHello(String name) {
  print('Xin chào, $name!');
}

// ----------------------------------------------------------
// 2. Hàm có giá trị trả về
// ----------------------------------------------------------
int add(int a, int b) {
  return a + b;
}

String getGreeting(String name) {
  return 'Hello, $name!';
}

// ----------------------------------------------------------
// 3. Hàm rút gọn với => (arrow function)
// ----------------------------------------------------------
// Dùng khi thân hàm chỉ có 1 dòng return
int multiply(int a, int b) => a * b;

bool isAdult(int age) => age >= 18;

// ----------------------------------------------------------
// 4. Tham số tùy chọn theo vị trí — dùng []
// ----------------------------------------------------------
// Tham số trong [] có thể bỏ qua khi gọi hàm
void introduce(String name, [int age = 0, String country = 'Việt Nam']) {
  print('Tên: $name | Tuổi: $age | Quốc gia: $country');
}

// ----------------------------------------------------------
// 5. Tham số có tên — dùng {}
// ----------------------------------------------------------
// Gọi hàm rõ ràng hơn, không cần nhớ thứ tự
void createProfile({
  required String name,   // bắt buộc phải truyền
  int age = 18,           // có giá trị mặc định
  String role = 'user',   // có giá trị mặc định
}) {
  print('$name | $age tuổi | role: $role');
}

// ----------------------------------------------------------
// 6. Hàm là giá trị — truyền hàm vào hàm khác
// ----------------------------------------------------------
// Trong Dart, hàm là "first-class object":
// có thể lưu vào biến, truyền như tham số, trả về từ hàm khác

void runTwice(void Function() action) {
  action();
  action();
}

int calculate(int a, int b, int Function(int, int) operation) {
  return operation(a, b);
}

// ----------------------------------------------------------
// 7. Hàm lồng nhau (nested function)
// ----------------------------------------------------------
// Hàm khai báo bên trong hàm khác, chỉ dùng được bên trong đó
void processOrder(String item, int quantity) {
  // hàm nội bộ, chỉ dùng trong processOrder
  double calcTotal(double price) => price * quantity;

  print('Đơn hàng: $item x$quantity');
  print('Thành tiền: ${calcTotal(25000)}đ');
}

// ----------------------------------------------------------
// 8. Hàm ẩn danh (anonymous / lambda)
// ----------------------------------------------------------
// Hàm không có tên, thường dùng ngắn gọn tại chỗ

void main() {
  // --- Cơ bản ---
  sayHello('Doan');
  print('3 + 4 = ${add(3, 4)}');
  print(getGreeting('Dart'));

  // --- Arrow function ---
  print('\n--- Arrow ---');
  print('5 × 6 = ${multiply(5, 6)}');
  print('20 tuổi có phải người lớn? ${isAdult(20)}');
  print('15 tuổi có phải người lớn? ${isAdult(15)}');

  // --- Tham số tùy chọn [] ---
  print('\n--- Optional positional ---');
  introduce('Doan');                        // bỏ qua age và country
  introduce('Minh', 25);                   // bỏ qua country
  introduce('Lan', 22, 'Singapore');       // đầy đủ

  // --- Tham số có tên {} ---
  print('\n--- Named parameters ---');
  createProfile(name: 'Doan');
  createProfile(name: 'Admin', age: 30, role: 'admin');
  createProfile(age: 25, name: 'Minh');    // thứ tự không quan trọng

  // --- Hàm là giá trị ---
  print('\n--- Function as value ---');
  runTwice(() => print('Ping!'));           // lambda truyền vào

  print('Cộng:  ${calculate(10, 3, add)}');       // truyền hàm add
  print('Nhân:  ${calculate(10, 3, multiply)}');  // truyền hàm multiply
  print('Trừ:   ${calculate(10, 3, (a, b) => a - b)}'); // lambda tại chỗ

  // --- Hàm lồng nhau ---
  print('\n--- Nested function ---');
  processOrder('Áo thun', 3);

  // --- Hàm ẩn danh với collection ---
  print('\n--- Lambda với List ---');
  List<int> numbers = [5, 2, 8, 1, 9, 3];

  // map: biến đổi từng phần tử
  var doubled = numbers.map((n) => n * 2).toList();
  print('Nhân đôi:  $doubled');

  // where: lọc phần tử
  var evens = numbers.where((n) => n.isEven).toList();
  print('Số chẵn:   $evens');

  // sort: sắp xếp
  numbers.sort((a, b) => a.compareTo(b));
  print('Sắp xếp:   $numbers');

  // reduce: gộp thành 1 giá trị
  int sum = numbers.reduce((acc, n) => acc + n);
  print('Tổng:      $sum');

  // ----------------------------------------------------------
  // TỔNG KẾT
  // ----------------------------------------------------------
  // void fn(T p)           → không trả giá trị
  // T fn(T p)              → trả giá trị kiểu T
  // T fn(T p) => expr      → rút gọn, 1 dòng
  // fn(T p, [T opt])       → tham số tùy chọn theo vị trí
  // fn({required T p})     → tham số có tên, bắt buộc
  // fn({T p = default})    → tham số có tên, có mặc định
  // void Function()        → kiểu của một hàm (dùng làm tham số)
  // (p) => expr            → lambda / hàm ẩn danh
}
