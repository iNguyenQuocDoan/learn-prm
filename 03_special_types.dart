// ============================================================
// DART - CÁC KIỂU ĐẶC BIỆT: dynamic, Object, void, Never, Runes
// ============================================================
//
// Ngoài các kiểu cơ bản (String, int, double...), Dart còn có
// một số kiểu đặc biệt phục vụ các tình huống cụ thể.

// ----------------------------------------------------------
// Hàm dùng kiểu Never — không bao giờ trả về bình thường
// ----------------------------------------------------------
// Never được dùng khi hàm LUÔN ném lỗi hoặc chạy vô hạn.
// Dart dùng điều này để phân tích luồng code (flow analysis).

Never throwError(String message) {
  throw Exception(message);
}

void checkAge(int age) {
  if (age < 18) {
    throwError('Bạn chưa đủ 18 tuổi!');
    // Dart biết dòng dưới đây không bao giờ được thực thi
    // vì throwError có kiểu Never
  }
  print('Chào mừng! Bạn đủ tuổi truy cập.');
}

void main() {
  // ----------------------------------------------------------
  // 1. dynamic — kiểu linh hoạt, có thể đổi kiểu bất cứ lúc nào
  // ----------------------------------------------------------
  dynamic value = 42;
  print('value = $value (int)');

  value = 'xin chào';   // đổi sang String — OK với dynamic
  print('value = $value (String)');

  value = true;          // đổi sang bool — vẫn OK
  print('value = $value (bool)');

  // Cảnh báo: dynamic bỏ qua kiểm tra kiểu tại compile-time.
  // Lỗi chỉ xuất hiện lúc chạy (runtime), khó debug hơn.
  // Chỉ dùng dynamic khi thực sự cần thiết (ví dụ: parse JSON).

  // ----------------------------------------------------------
  // 2. Object — kiểu cha của mọi kiểu trong Dart
  // ----------------------------------------------------------
  Object obj1 = 'dart';
  Object obj2 = 123;
  Object obj3 = [1, 2, 3];

  print('\nobj1 = $obj1');
  print('obj2 = $obj2');
  print('obj3 = $obj3');

  // Object KHÔNG có thuộc tính length — phải ép kiểu trước
  // obj1.length  ← LỖI compile-time
  print('độ dài chuỗi = ${(obj1 as String).length}');  // ép kiểu bằng `as`

  // Khác với dynamic: Object vẫn kiểm tra kiểu tại compile-time,
  // nên an toàn hơn dynamic.

  // ----------------------------------------------------------
  // 3. void — hàm không trả về giá trị
  // ----------------------------------------------------------
  // void sayHi() nghĩa là hàm này chạy xong mà không trả gì cả.
  void sayHi(String name) {
    print('\nXin chào, $name!');
  }

  sayHi('Doan');

  // ----------------------------------------------------------
  // 4. Never — hàm không bao giờ hoàn thành bình thường
  // ----------------------------------------------------------
  checkAge(20);   // hợp lệ → in ra lời chào

  // checkAge(15);  // sẽ ném Exception: Bạn chưa đủ 18 tuổi!

  // ----------------------------------------------------------
  // 5. Runes — ký tự Unicode đặc biệt
  // ----------------------------------------------------------
  // String thông thường lưu UTF-16, nhưng một số ký tự như
  // emoji hay ký tự đặc biệt cần nhiều hơn 2 byte → dùng Runes.

  Runes heart   = Runes('♥');  // ♥ trái tim
  Runes smiley  = Runes('☺');  // ☺ mặt cười

  print('\nRunes heart  = ${String.fromCharCodes(heart)}');
  print('Runes smiley = ${String.fromCharCodes(smiley)}');

  // Cách thông dụng hơn với emoji hiện đại:
  print('Emoji trực tiếp: ❤️ 😊 🎯');

  // ----------------------------------------------------------
  // TỔNG KẾT SO SÁNH
  // ----------------------------------------------------------
  // dynamic → linh hoạt nhất, nhưng mất type-safety
  // Object  → cha của tất cả, vẫn có type-safety tại compile-time
  // void    → hàm không trả giá trị
  // Never   → hàm không bao giờ kết thúc bình thường (throw/loop vô hạn)
  // Runes   → làm việc với ký tự Unicode đặc biệt
}
