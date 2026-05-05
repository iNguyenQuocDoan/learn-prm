// ============================================================
// DART - ASYNC / AWAIT: BẤT ĐỒNG BỘ
// ============================================================
//
// Bất đồng bộ (async) = làm việc mà không chặn chương trình.
// Ví dụ thực tế: gọi API, đọc file, truy vấn database —
// những thứ mất thời gian chờ, không có kết quả ngay lập tức.
//
// Dart dùng:
//   Future<T>  → đại diện cho một giá trị sẽ có trong tương lai
//   async      → đánh dấu hàm là bất đồng bộ
//   await      → chờ Future hoàn thành trước khi tiếp tục

import 'dart:async';

// ----------------------------------------------------------
// 1. Future cơ bản — hàm trả về sau một khoảng thời gian
// ----------------------------------------------------------
Future<String> fetchUsername() async {
  // Giả lập gọi API mất 2 giây
  await Future.delayed(Duration(seconds: 2));
  return 'Nguyen Quoc Doan';
}

Future<int> fetchUserAge() async {
  await Future.delayed(Duration(seconds: 1));
  return 20;
}

// ----------------------------------------------------------
// 2. Hàm async có thể throw lỗi
// ----------------------------------------------------------
Future<String> fetchData(bool shouldFail) async {
  await Future.delayed(Duration(seconds: 1));

  if (shouldFail) {
    throw Exception('Lỗi kết nối mạng!');
  }

  return 'Dữ liệu từ server';
}

// ----------------------------------------------------------
// 3. Chạy nhiều Future cùng lúc — Future.wait
// ----------------------------------------------------------
Future<void> fetchAll() async {
  print('Bắt đầu fetch song song...');
  final stopwatch = Stopwatch()..start();

  // Chạy 2 Future cùng lúc, không chờ cái này xong mới chạy cái kia
  final results = await Future.wait([
    fetchUsername(),
    fetchUserAge(),
  ]);

  stopwatch.stop();
  print('Username: ${results[0]}');
  print('Age:      ${results[1]}');
  print('Tổng thời gian: ${stopwatch.elapsedMilliseconds}ms'); // ~2000ms (không phải 3000ms)
}

// ----------------------------------------------------------
// 4. Stream — luồng dữ liệu liên tục theo thời gian
// ----------------------------------------------------------
// Future: trả về 1 giá trị duy nhất
// Stream: trả về nhiều giá trị theo thời gian (như video stream, websocket)

Stream<int> countdown(int from) async* {
  for (int i = from; i >= 0; i--) {
    await Future.delayed(Duration(milliseconds: 500));
    yield i; // phát ra giá trị, rồi tiếp tục vòng lặp
  }
}

// ----------------------------------------------------------
// MAIN
// ----------------------------------------------------------
void main() async {
  // --- await cơ bản ---
  print('=== await cơ bản ===');
  print('Đang fetch username...');
  String name = await fetchUsername(); // chờ 2 giây
  print('Username: $name\n');

  // --- try/catch với async ---
  print('=== try/catch với async ===');

  // Trường hợp thành công
  try {
    String data = await fetchData(false);
    print('Thành công: $data');
  } catch (e) {
    print('Lỗi: $e');
  }

  // Trường hợp thất bại
  try {
    String data = await fetchData(true);
    print('Thành công: $data');
  } catch (e) {
    print('Lỗi bắt được: $e'); // in ra cái này
  }

  print('');

  // --- Future.wait — chạy song song ---
  print('=== Future.wait (song song) ===');
  await fetchAll();

  print('');

  // --- So sánh: tuần tự vs song song ---
  print('=== Tuần tự vs Song song ===');

  // Tuần tự: mất 2 + 1 = 3 giây
  var sw1 = Stopwatch()..start();
  await fetchUsername();
  await fetchUserAge();
  sw1.stop();
  print('Tuần tự:   ${sw1.elapsedMilliseconds}ms'); // ~3000ms

  // Song song: mất max(2, 1) = 2 giây
  var sw2 = Stopwatch()..start();
  await Future.wait([fetchUsername(), fetchUserAge()]);
  sw2.stop();
  print('Song song: ${sw2.elapsedMilliseconds}ms'); // ~2000ms

  print('');

  // --- Stream ---
  print('=== Stream: đếm ngược ===');
  await for (int value in countdown(5)) {
    print('Đếm: $value');
  }
  print('Hết giờ!');

  // ----------------------------------------------------------
  // TỔNG KẾT
  // ----------------------------------------------------------
  // Future<T>         → 1 giá trị trong tương lai
  // async             → đánh dấu hàm bất đồng bộ
  // await             → chờ Future hoàn thành
  // try/catch         → bắt lỗi từ Future
  // Future.wait([])   → chạy nhiều Future song song
  // Stream<T>         → nhiều giá trị theo thời gian
  // async*            → hàm trả về Stream
  // yield             → phát ra 1 giá trị trong Stream
  // await for         → lắng nghe từng giá trị của Stream
}
