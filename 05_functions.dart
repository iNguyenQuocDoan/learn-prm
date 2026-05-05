// ============================================================
// DART - HÀM: FUNCTIONS, RECORDS, TYPEDEF
// ============================================================
//
// Hàm trong Dart rất linh hoạt:
//   - Trả về nhiều giá trị qua Record
//   - Tham số có tên (named), tùy chọn (optional)
//   - Hàm rút gọn với =>
//   - typedef để đặt tên cho kiểu dữ liệu phức tạp

// ----------------------------------------------------------
// 1. Hàm cơ bản — khai báo ngoài main
// ----------------------------------------------------------
void greet(String name) {
  print('Xin chào, $name!');
}

int add(int a, int b) {
  return a + b;
}

// Hàm rút gọn với => (chỉ dùng khi thân hàm là 1 biểu thức)
int multiply(int a, int b) => a * b;

double circleArea(double radius) => 3.14159 * radius * radius;

// ----------------------------------------------------------
// 2. Tham số có tên (named parameters) — dùng {}
// ----------------------------------------------------------
// Gọi hàm rõ ràng hơn, không cần nhớ thứ tự tham số.
void createUser({required String name, required int age, String role = 'user'}) {
  print('Tạo user: $name | tuổi: $age | vai trò: $role');
}

// ----------------------------------------------------------
// 3. Hàm trả về Record — nhiều giá trị cùng lúc
// ----------------------------------------------------------
// Record là cách Dart trả về nhiều giá trị mà không cần class.
({bool success, String message, int? userId}) login(
  String username,
  String password,
) {
  if (username == 'admin' && password == '123') {
    return (success: true, message: 'Đăng nhập thành công', userId: 42);
  }
  return (success: false, message: 'Sai tên đăng nhập hoặc mật khẩu', userId: null);
}

// ----------------------------------------------------------
// 4. typedef — đặt tên cho kiểu dữ liệu phức tạp
// ----------------------------------------------------------
typedef StringList = List<String>;        // thay thế List<String>
typedef ScoreMap  = Map<String, int>;     // thay thế Map<String, int>
typedef Validator = bool Function(String); // kiểu hàm nhận String trả bool

bool isNotEmpty(String value) => value.trim().isNotEmpty;
bool isLongEnough(String value) => value.length >= 8;

// ----------------------------------------------------------
// 5. Hàm là first-class object — có thể truyền như tham số
// ----------------------------------------------------------
void validate(String input, Validator check, String errorMessage) {
  if (!check(input)) {
    print('Lỗi: $errorMessage');
  } else {
    print('Hợp lệ: "$input"');
  }
}

void main() {
  // --- Hàm cơ bản ---
  greet('Doan');
  print('3 + 4 = ${add(3, 4)}');
  print('3 × 4 = ${multiply(3, 4)}');
  print('Diện tích = ${circleArea(5).toStringAsFixed(2)}');

  // --- Named parameters ---
  print('');
  createUser(name: 'Doan', age: 20);
  createUser(name: 'Admin', age: 30, role: 'admin');
  // Thứ tự truyền không quan trọng với named parameters:
  createUser(age: 25, name: 'Minh');

  // --- Record ---
  print('');
  var result1 = login('admin', '123');
  print('Đăng nhập: ${result1.success} — ${result1.message}');
  print('User ID: ${result1.userId}');

  var result2 = login('guest', 'sai');
  print('Đăng nhập: ${result2.success} — ${result2.message}');

  // --- typedef ---
  print('');
  StringList names  = ['Doan', 'Minh', 'Lan'];
  ScoreMap   scores = {'toán': 9, 'lý': 8};

  print('names  = $names');
  print('scores = $scores');

  // --- Hàm truyền như tham số (dùng typedef Validator) ---
  print('');
  validate('hello', isNotEmpty, 'Không được để trống');
  validate('', isNotEmpty, 'Không được để trống');
  validate('abc123', isLongEnough, 'Mật khẩu phải có ít nhất 8 ký tự');
  validate('securePass!', isLongEnough, 'Mật khẩu phải có ít nhất 8 ký tự');

  // --- Hàm ẩn danh (anonymous function / lambda) ---
  print('');
  var doubleList = [1, 2, 3, 4, 5].map((x) => x * 2).toList();
  print('Nhân đôi: $doubleList');  // [2, 4, 6, 8, 10]

  var evens = [1, 2, 3, 4, 5].where((x) => x.isEven).toList();
  print('Số chẵn: $evens');       // [2, 4]

  // ----------------------------------------------------------
  // TỔNG KẾT
  // ----------------------------------------------------------
  // void fn()              → không trả giá trị
  // int fn()               → trả int
  // int fn() => expr       → rút gọn, thân là 1 biểu thức
  // fn({required T param}) → named parameter, bắt buộc truyền
  // fn({T param = val})    → named parameter, có giá trị mặc định
  // ({T a, T b}) fn()      → Record, trả nhiều giá trị
  // typedef Name = Type    → đặt tên ngắn cho kiểu phức tạp
  // (x) => expr            → hàm ẩn danh (lambda)
}
