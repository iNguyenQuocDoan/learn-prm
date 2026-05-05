// ============================================================
// DART - LIST<T> VS LIST<DYNAMIC>: SỰ KHÁC BIỆT QUAN TRỌNG
// ============================================================
//
// Khi tạo List, Dart cho phép chỉ định kiểu phần tử (T).
// Điều này ảnh hưởng đến tính an toàn kiểu (type safety).

void main() {
  // ----------------------------------------------------------
  // 1. List<int> — chỉ chứa số nguyên
  // ----------------------------------------------------------
  List<int> intList = [1, 2, 3];

  intList.add(4);       // OK — 4 là int
  intList.add(5);       // OK — 5 là int
  // intList.add('xin chào');  ← LỖI compile-time: String không phải int

  print('intList = $intList');  // [1, 2, 3, 4, 5]

  // ----------------------------------------------------------
  // 2. List<String> — chỉ chứa chuỗi
  // ----------------------------------------------------------
  List<String> nameList = ['Doan', 'Minh'];

  nameList.add('Lan');   // OK
  // nameList.add(42);   ← LỖI compile-time: int không phải String

  print('nameList = $nameList');  // [Doan, Minh, Lan]

  // ----------------------------------------------------------
  // 3. List<dynamic> — chứa BẤT KỲ kiểu nào
  // ----------------------------------------------------------
  List<dynamic> mixedList = [1, 2, 3];

  mixedList.add(4);           // OK — int
  mixedList.add('xin chào');  // OK — String
  mixedList.add(true);        // OK — bool
  mixedList.add([10, 20]);    // OK — List lồng nhau

  print('mixedList = $mixedList');  // [1, 2, 3, 4, xin chào, true, [10, 20]]

  // Nhược điểm: khi đọc ra, bạn không biết kiểu thực sự là gì
  // → phải kiểm tra kiểu trước khi dùng
  for (var item in mixedList) {
    if (item is int) {
      print('$item × 2 = ${item * 2}');
    } else if (item is String) {
      print('"$item" có ${item.length} ký tự');
    }
  }

  // ----------------------------------------------------------
  // 4. var với List — Dart tự suy kiểu
  // ----------------------------------------------------------
  var autoList = [1, 2, 3];
  // Dart suy ra đây là List<int> vì tất cả phần tử là int

  autoList.add(4);    // OK
  // autoList.add('hello');  ← LỖI — Dart đã suy ra List<int>

  print('\nautoList = $autoList (kiểu: List<int>)');

  var mixedAuto = [1, 'hello', true];
  // Dart suy ra List<Object> vì phần tử có nhiều kiểu khác nhau

  print('mixedAuto = $mixedAuto (kiểu: List<Object>)');

  // ----------------------------------------------------------
  // TỔNG KẾT
  // ----------------------------------------------------------
  // List<int>      → an toàn, chỉ chứa int, lỗi ngay tại compile
  // List<String>   → an toàn, chỉ chứa String
  // List<dynamic>  → linh hoạt, chứa mọi kiểu, mất type safety
  // var list = []  → Dart tự suy kiểu từ phần tử đầu tiên
  //
  // Nguyên tắc: dùng kiểu cụ thể (List<int>, List<String>...)
  // khi biết trước dữ liệu. Chỉ dùng List<dynamic> khi thực sự
  // cần lưu nhiều kiểu khác nhau (ví dụ: parse JSON).
}
