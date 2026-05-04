void main() {
  var name = 'doan';

  var age = 20;

  String name1 = "doan";
  int age1 = 20;

  double height = 1.75;

  List<String> fruits = ['tao', 'cam', 'nho'];

  Map<String, int> score = {'toan': 9, 'ly': 8, 'hoa': 7};

  Set<String> foods = {"com", "pho", "bun", "com"};

  dynamic a = 5;
  a = 'hello';

  print(foods);
  print(a);

  void sayHello() {
    print("hello ${name}");
  }

  Never sayGoodbye() {
    throw Exception("Goodbye!");
  }

  Never runForever() {
    while (true) {
      print("Running...");
    }
  }

  Never fail(String msg) {
    throw Exception(msg);
  }

  void checkAge(int age) {
    if (age < 18) {
      fail("you must be at least 18 years old");
    } else {
      print("welcome! ${name}");
    }
  }

  Object obj = 'hello';
  Object obj2 = 123;

  Object x = 'dart';

  print(
    (x as String).length,
  ); // lỗi vì Object không có thuộc tính length, phải ép kiểu về String trước khi truy cập thuộc tính length

  var z = 'dart is great';
  print(z.length); // không lỗi vì z là String

  ({bool success, String msg}) login(String username, String password) {
    if (username == 'admin' && password == '123') {
      return (success: true, msg: "Login successful");
    } else {
      return (success: false, msg: "Invalid username or password");
    }
  }

  Runes heart = Runes('\u2665'); // Unicode cho ký tự trái tim
  print(String.fromCharCodes(heart)); // in ra ký tự trái tim

  // OOP: Lập trình hướng đối tượng
  // class: lớp, là một khuôn mẫu để tạo ra các đối tượng
  // object: đối tượng, là một thực thể cụ thể được tạo ra từ lớp
  // constructor: hàm khởi tạo, được gọi khi tạo đối tượng từ lớp
  // class Person {
  //   String name;
  //   int age;

  String? nameNull =
      "doan null"; // biến nullable, có thể chứa giá trị null hoặc một chuỗi, phải kiểm tra null trước khi sử dụng biến này
  print(
    nameNull!.length,
  ); // lỗi nếu nameNull là null, phải kiểm tra null trước khi sử dụng biến này

  String _name =
      "Nguyen quoc doan _private"; // biến private, chỉ có thể truy cập trong class
  print(_name);

  late String nameLate =
      ' doan late'; // biến late, phải gán giá trị trước khi sử dụng, nếu không sẽ gây lỗi khi truy cập biến này
  print(
    nameLate,
  ); // lỗi vì nameLate chưa được khởi tạo, phải gán giá trị cho nameLate trước khi sử dụng

  const int MAX_AGE =
      120; // biến hằng, không thể thay đổi giá trị sau khi đã gán, phải gán giá trị khi khai báo biến này
  print(MAX_AGE);

  final String COUNTRY;

  COUNTRY =
      "Vietnam"; // biến hằng, không thể thay đổi giá trị sau khi đã gán, có thể gán giá trị sau khi khai báo biến này nhưng chỉ được gán một lần
  print(COUNTRY);

  // dùng const và final để khai báo hằng số, nhưng const phải gán giá trị tại thời điểm khai báo, còn final có thể gán giá trị sau khi khai báo nhưng chỉ được gán một lần

  // checkAge(18);

  // sayHello();
  // sayGoodbye();
  // runForever();
}

// khai báo biến trong dart
// var: tự động xác định kiểu dữ liệu
// string: chuỗi
// int: số nguyên
// double: số thực
// list: danh sách
// map: bản đồ (key-value)
// set: tập hợp (không có thứ tự, không trùng lặp)
// dynamic: kiểu dữ liệu động (có thể thay đổi kiểu dữ liệu)


// hàm trong dart
// void: không trả về giá trị, không thể gán được
// Never: không bao giờ trả về giá trị, thường dùng để ném lỗi hoặc kết thúc chương trình
// Object: kiểu dữ liệu cơ bản nhất, có thể chứa bất kỳ giá trị nào, nhưng không thể truy cập các thuộc tính hoặc phương thức của giá trị đó mà không ép kiểu trước
// length: thuộc tính của chuỗi hoặc danh sách, trả về độ dài của chuỗi hoặc số phần tử trong danh sách

