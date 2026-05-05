// ============================================================
// DART - COLLECTIONS: LIST, MAP, SET
// ============================================================
//
// Collections là các cấu trúc dữ liệu để lưu nhiều giá trị.
// Dart có 3 loại chính:
//   List → danh sách có thứ tự, cho phép trùng lặp   (như mảng)
//   Map  → cặp key-value, tra cứu nhanh theo key
//   Set  → tập hợp KHÔNG có thứ tự, KHÔNG trùng lặp

void main() {
  // ----------------------------------------------------------
  // 1. List<T> — danh sách có thứ tự
  // ----------------------------------------------------------
  List<String> fruits = ['táo', 'cam', 'nho'];
  // Chỉ số (index) bắt đầu từ 0:
  //   fruits[0] = 'táo'
  //   fruits[1] = 'cam'
  //   fruits[2] = 'nho'

  print('fruits     = $fruits');           // [táo, cam, nho]
  print('fruits[0]  = ${fruits[0]}');      // táo
  print('số phần tử = ${fruits.length}');  // 3

  fruits.add('xoài');      // thêm vào cuối
  fruits.remove('cam');    // xóa phần tử theo giá trị

  print('sau khi sửa = $fruits');  // [táo, nho, xoài]

  // Duyệt qua List
  for (var fruit in fruits) {
    print('  - $fruit');
  }

  // ----------------------------------------------------------
  // 2. Map<K, V> — cặp key-value (giống từ điển)
  // ----------------------------------------------------------
  Map<String, int> scores = {
    'toán': 9,
    'lý'  : 8,
    'hóa' : 7,
  };

  print('\nscores         = $scores');
  print('điểm toán      = ${scores['toán']}');  // 9
  print('số môn         = ${scores.length}');   // 3

  scores['văn'] = 10;           // thêm cặp mới
  scores.remove('hóa');         // xóa theo key
  scores['lý'] = 9;             // cập nhật giá trị

  print('sau khi sửa    = $scores');

  // Duyệt qua Map
  scores.forEach((subject, score) {
    print('  $subject: $score điểm');
  });

  // ----------------------------------------------------------
  // 3. Set<T> — tập hợp, KHÔNG trùng lặp, KHÔNG có thứ tự
  // ----------------------------------------------------------
  Set<String> foods = {'cơm', 'phở', 'bún'};

  print('\nfoods = $foods');  // {cơm, phở, bún}

  foods.add('bánh mì');
  foods.add('phở');   // 'phở' đã tồn tại → Set bỏ qua, không thêm vào

  print('sau khi thêm = $foods');
  print('có cơm không? = ${foods.contains('cơm')}');  // true

  // ----------------------------------------------------------
  // SO SÁNH NHANH
  // ----------------------------------------------------------
  // List → dùng khi cần giữ thứ tự, chấp nhận trùng lặp
  //         ví dụ: danh sách bước thực hiện, lịch sử hành động
  //
  // Map  → dùng khi cần tra cứu theo tên/key
  //         ví dụ: bảng điểm, cấu hình, từ điển
  //
  // Set  → dùng khi cần đảm bảo mỗi giá trị chỉ xuất hiện 1 lần
  //         ví dụ: danh sách tag, quyền truy cập
}
