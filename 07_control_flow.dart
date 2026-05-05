// ============================================================
// DART - CONTROL FLOW: IF/ELSE, SWITCH, VÒNG LẶP
// ============================================================

bool _getFlag(bool value) => value;

void main() {
  // ----------------------------------------------------------
  // 1. if / else if / else
  // ----------------------------------------------------------
  int score = 75;

  if (score >= 90) {
    print('Xuất sắc');
  } else if (score >= 70) {
    print('Khá');        // in ra cái này vì score = 75
  } else if (score >= 50) {
    print('Trung bình');
  } else {
    print('Yếu');
  }

  // ----------------------------------------------------------
  // 2. if với điều kiện kết hợp (&&, ||, !)
  // ----------------------------------------------------------
  // Dùng hàm để Dart không biết trước giá trị → minh họa đúng cả 3 nhánh
  bool isLoggedIn = _getFlag(true);
  bool isAdmin    = _getFlag(false);

  if (isLoggedIn && isAdmin) {
    print('Xem được trang admin');
  } else if (isLoggedIn && !isAdmin) {
    print('Đã đăng nhập, nhưng không phải admin');  // in ra cái này
  } else {
    print('Chưa đăng nhập');
  }

  // ----------------------------------------------------------
  // 3. Toán tử ba ngôi — rút gọn if/else một dòng
  // ----------------------------------------------------------
  // cú pháp: condition ? valueIfTrue : valueIfFalse

  int age  = 20;
  String status = age >= 18 ? 'Người lớn' : 'Trẻ em';
  print('\nstatus = $status');  // Người lớn

  int a = 10, b = 3;
  int max = a > b ? a : b;
  print('max($a, $b) = $max');  // 10

  // ----------------------------------------------------------
  // 4. switch / case — so sánh một giá trị với nhiều trường hợp
  // ----------------------------------------------------------
  String day = 'Monday';

  switch (day) {
    case 'Monday':
    case 'Tuesday':
    case 'Wednesday':
    case 'Thursday':
    case 'Friday':
      print('\n$day là ngày làm việc');
      break;
    case 'Saturday':
    case 'Sunday':
      print('\n$day là cuối tuần');
      break;
    default:
      print('\nKhông rõ ngày');
  }

  // Dart 3+: switch expression — gọn hơn, trả về giá trị
  String type = switch (day) {
    'Saturday' || 'Sunday' => 'Cuối tuần',
    _                      => 'Ngày làm việc',
  };
  print('Loại ngày: $type');

  // ----------------------------------------------------------
  // 5. for — lặp với số lần xác định
  // ----------------------------------------------------------
  print('\n--- for loop ---');
  for (int i = 1; i <= 5; i++) {
    print('i = $i');
  }

  // ----------------------------------------------------------
  // 6. for-in — duyệt qua collection
  // ----------------------------------------------------------
  print('\n--- for-in ---');
  List<String> fruits = ['táo', 'cam', 'nho'];

  for (var fruit in fruits) {
    print('Trái cây: $fruit');
  }

  // ----------------------------------------------------------
  // 7. while — lặp khi điều kiện còn đúng
  // ----------------------------------------------------------
  print('\n--- while ---');
  int count = 1;

  while (count <= 3) {
    print('count = $count');
    count++;
  }

  // ----------------------------------------------------------
  // 8. do-while — chạy ít nhất 1 lần trước khi kiểm tra điều kiện
  // ----------------------------------------------------------
  print('\n--- do-while ---');
  int x = 10;

  do {
    print('x = $x');  // in ra dù x = 10 > 5
    x++;
  } while (x < 5);   // điều kiện sai ngay từ đầu nhưng vẫn chạy 1 lần

  // ----------------------------------------------------------
  // 9. break và continue
  // ----------------------------------------------------------
  print('\n--- break và continue ---');
  for (int i = 1; i <= 10; i++) {
    if (i == 4) continue;  // bỏ qua i = 4
    if (i == 7) break;     // dừng hẳn khi i = 7
    print('i = $i');       // in: 1, 2, 3, 5, 6
  }

  // ----------------------------------------------------------
  // TỔNG KẾT
  // ----------------------------------------------------------
  // if/else          → rẽ nhánh theo điều kiện
  // ? :              → rút gọn if/else một dòng
  // switch/case      → so sánh một giá trị nhiều trường hợp
  // switch expr      → Dart 3+, switch trả về giá trị
  // for              → lặp có đếm (biết trước số lần)
  // for-in           → duyệt collection
  // while            → lặp khi điều kiện đúng (kiểm tra trước)
  // do-while         → lặp khi điều kiện đúng (kiểm tra sau, chạy ít nhất 1 lần)
  // break            → thoát khỏi vòng lặp
  // continue         → bỏ qua lần lặp hiện tại, tiếp tục lần tiếp theo
}
