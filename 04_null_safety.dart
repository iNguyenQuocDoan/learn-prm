// ============================================================
// DART - NULL SAFETY: NULLABLE, LATE, FINAL, CONST
// ============================================================
//
// Null Safety là tính năng quan trọng nhất của Dart hiện đại.
// Mục tiêu: loại bỏ lỗi NullPointerException ngay tại compile-time.
//
// Quy tắc cốt lõi:
//   String  name  → KHÔNG thể null, phải luôn có giá trị
//   String? name  → CÓ THỂ null (dấu ? đánh dấu nullable)

String? _getNickname({required bool useValue}) {
  return useValue ? 'doan' : null;
}

void main() {
  // ----------------------------------------------------------
  // 1. Nullable (?) — biến có thể chứa null
  // ----------------------------------------------------------
  // Dùng hàm trả về nullable để Dart không biết trước giá trị
  String? nickname = _getNickname(useValue: true);   // trả về 'doan'
  String? empty    = _getNickname(useValue: false);  // trả về null

  print('nickname = $nickname');  // doan
  print('empty    = $empty');     // null

  // Muốn dùng thuộc tính của nullable → phải kiểm tra null trước
  if (nickname != null) {
    print('độ dài nickname = ${nickname.length}');  // an toàn
  }

  // Cú pháp ngắn gọn hơn: ?. (null-aware access)
  print('độ dài empty = ${empty?.length}');  // null (không crash)

  // ! (null assertion) — dùng khi bạn CHẮC CHẮN biến không null
  print('độ dài nickname = ${nickname!.length}');
  // Cảnh báo: nếu nickname thực sự null thì app sẽ crash!
  // Chỉ dùng ! khi bạn tự tin 100%.

  // ?? (null coalescing) — giá trị mặc định nếu null
  String displayName = empty ?? 'Người dùng ẩn danh';
  print('displayName = $displayName');  // Người dùng ẩn danh

  // ----------------------------------------------------------
  // 2. late — khai báo trước, gán sau
  // ----------------------------------------------------------
  // Dùng khi bạn biết biến sẽ được gán trước khi đọc,
  // nhưng không thể gán ngay lúc khai báo.

  late String greeting;
  // Nếu đọc `greeting` trước khi gán → crash tại runtime!

  greeting = 'Xin chào, Doan!';  // gán trước khi dùng
  print('\n$greeting');

  // Ứng dụng thực tế: khởi tạo trong constructor hoặc initState()
  late String configPath;
  configPath = 'assets/config.json';
  print('configPath = $configPath');

  // ----------------------------------------------------------
  // 3. final — hằng số, gán một lần, KHÔNG đổi được
  // ----------------------------------------------------------
  // final cho phép gán giá trị SAU khi khai báo, nhưng chỉ 1 lần.

  final String country;
  country = 'Việt Nam';   // gán lần đầu → OK
  // country = 'USA';     // gán lần 2 → LỖI compile-time

  print('\ncountry = $country');

  final birthYear = 2004;       // Dart tự suy kiểu là int
  final now       = DateTime.now();  // giá trị tính lúc runtime

  print('birthYear = $birthYear');
  print('now       = $now');

  // ----------------------------------------------------------
  // 4. const — hằng số compile-time, giá trị phải biết trước
  // ----------------------------------------------------------
  // const phải được gán giá trị NGAY KHI KHAI BÁO
  // và giá trị đó phải biết tại compile-time (không phụ thuộc runtime).

  const int maxAge   = 120;
  const double pi    = 3.14159;
  const String appName = 'LearnDart';

  print('\nmaxAge  = $maxAge');
  print('pi      = $pi');
  print('appName = $appName');

  // const DateTime now2 = DateTime.now();  ← LỖI!
  // DateTime.now() chỉ biết lúc chạy, không phải lúc compile.

  // ----------------------------------------------------------
  // SO SÁNH final vs const
  // ----------------------------------------------------------
  // | Tiêu chí              | final              | const              |
  // |-----------------------|--------------------|-------------------|
  // | Gán ngay khi khai báo | Không bắt buộc     | Bắt buộc          |
  // | Giá trị lúc nào       | Runtime hoặc trước | Compile-time      |
  // | Dùng trong class      | Được (instance)    | Phải static       |
  // | Ví dụ hợp lệ          | final x = fn()     | const x = 42      |

  // ----------------------------------------------------------
  // TỔNG KẾT NULL SAFETY
  // ----------------------------------------------------------
  // String  → không bao giờ null, Dart đảm bảo điều này
  // String? → có thể null, phải xử lý trước khi dùng
  // ?.      → truy cập an toàn, trả về null nếu biến null
  // ??      → giá trị mặc định khi gặp null
  // !       → ép buộc non-null (dùng cẩn thận)
  // late    → gán sau, nhưng phải gán trước khi đọc
  // final   → gán một lần, giá trị có thể là runtime
  // const   → hằng compile-time, bất biến hoàn toàn
}
