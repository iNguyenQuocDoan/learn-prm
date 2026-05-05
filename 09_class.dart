// ============================================================
// DART - CLASS: LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG (OOP)
// ============================================================
//
// Class là khuôn mẫu để tạo ra các object (đối tượng).
// Ví dụ: class Person là khuôn mẫu, còn 'Doan 20 tuổi' là object.

// ----------------------------------------------------------
// 1. Class cơ bản
// ----------------------------------------------------------
class Person {
  // Properties (thuộc tính) — dữ liệu của object
  String name;
  int age;

  // Constructor — chạy khi tạo object mới
  Person(this.name, this.age); // cú pháp ngắn gọn của Dart

  // Method (phương thức) — hành động của object
  void introduce() {
    print('Tôi là $name, $age tuổi.');
  }

  bool isAdult() => age >= 18;
}

// ----------------------------------------------------------
// 2. Named constructor — nhiều cách khởi tạo khác nhau
// ----------------------------------------------------------
class Point {
  double x;
  double y;

  Point(this.x, this.y);

  // Named constructor: tạo điểm gốc (0, 0)
  Point.origin()
      : x = 0,
        y = 0;

  // Named constructor: tạo từ Map
  Point.fromMap(Map<String, double> map)
      : x = map['x'] ?? 0,
        y = map['y'] ?? 0;

  double distanceTo(Point other) {
    double dx = x - other.x;
    double dy = y - other.y;
    return (dx * dx + dy * dy); // bình phương khoảng cách (đơn giản hóa)
  }

  @override
  String toString() => 'Point($x, $y)';
}

// ----------------------------------------------------------
// 3. Getter và Setter — kiểm soát truy cập thuộc tính
// ----------------------------------------------------------
class Rectangle {
  double width;
  double height;

  Rectangle(this.width, this.height);

  // Getter — tính toán từ thuộc tính có sẵn, không lưu riêng
  double get area => width * height;
  double get perimeter => 2 * (width + height);

  // Setter — kiểm tra giá trị trước khi gán
  set setWidth(double value) {
    if (value <= 0) throw ArgumentError('Chiều rộng phải > 0');
    width = value;
  }

  @override
  String toString() => 'Rectangle(${width}x${height})';
}

// ----------------------------------------------------------
// 4. Kế thừa (Inheritance) — extends
// ----------------------------------------------------------
class Animal {
  String name;

  Animal(this.name);

  void speak() {
    print('$name tạo ra âm thanh');
  }

  void eat() {
    print('$name đang ăn');
  }
}

class Dog extends Animal {
  String breed; // thêm thuộc tính riêng

  Dog(super.name, this.breed); // super truyền name lên Animal

  @override // ghi đè phương thức của class cha
  void speak() {
    print('$name sủa: Gâu gâu!');
  }

  void fetch() {
    print('$name đang bắt bóng');
  }
}

class Cat extends Animal {
  Cat(super.name);

  @override
  void speak() {
    print('$name kêu: Meo meo!');
  }
}

// ----------------------------------------------------------
// 5. Abstract class — lớp trừu tượng, không thể tạo object trực tiếp
// ----------------------------------------------------------
abstract class Shape {
  // Phương thức trừu tượng — bắt buộc class con phải implement
  double area();
  double perimeter();

  // Phương thức bình thường — class con dùng được luôn
  void describe() {
    print('Diện tích: ${area().toStringAsFixed(2)}, Chu vi: ${perimeter().toStringAsFixed(2)}');
  }
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double area() => 3.14159 * radius * radius;

  @override
  double perimeter() => 2 * 3.14159 * radius;
}

class Square extends Shape {
  double side;
  Square(this.side);

  @override
  double area() => side * side;

  @override
  double perimeter() => 4 * side;
}

// ----------------------------------------------------------
// 6. Interface (implements) — ký hợp đồng về hành vi
// ----------------------------------------------------------
// Trong Dart, mọi class đều có thể dùng như interface
abstract class Flyable {
  void fly();
}

abstract class Swimmable {
  void swim();
}

// Duck vừa bay được vừa bơi được
class Duck extends Animal implements Flyable, Swimmable {
  Duck(super.name);

  @override
  void speak() => print('$name kêu: Quạc quạc!');

  @override
  void fly() => print('$name đang bay');

  @override
  void swim() => print('$name đang bơi');
}

// ----------------------------------------------------------
// MAIN
// ----------------------------------------------------------
void main() {
  // --- Class cơ bản ---
  print('=== Person ===');
  var p1 = Person('Doan', 20);
  var p2 = Person('Minh', 16);

  p1.introduce();
  p2.introduce();
  print('${p1.name} là người lớn? ${p1.isAdult()}');
  print('${p2.name} là người lớn? ${p2.isAdult()}');

  // --- Named constructor ---
  print('\n=== Point ===');
  var a = Point(3, 4);
  var origin = Point.origin();
  var b = Point.fromMap({'x': 1.0, 'y': 2.0});

  print('a = $a');
  print('origin = $origin');
  print('b = $b');

  // --- Getter / Setter ---
  print('\n=== Rectangle ===');
  var rect = Rectangle(5, 3);
  print('$rect');
  print('Diện tích:  ${rect.area}');
  print('Chu vi:     ${rect.perimeter}');
  rect.setWidth = 10;
  print('Sau khi đổi width: ${rect.area}');

  // --- Kế thừa ---
  print('\n=== Kế thừa ===');
  var dog = Dog('Rex', 'Golden');
  var cat = Cat('Mimi');

  dog.speak();   // ghi đè
  dog.eat();     // kế thừa từ Animal
  dog.fetch();   // riêng của Dog
  cat.speak();   // ghi đè

  // --- Abstract class ---
  print('\n=== Shape ===');
  List<Shape> shapes = [Circle(5), Square(4)];

  for (var shape in shapes) {
    shape.describe();
  }

  // --- Interface ---
  print('\n=== Duck ===');
  var duck = Duck('Donald');
  duck.speak();
  duck.fly();
  duck.swim();
  duck.eat(); // kế thừa từ Animal

  // ----------------------------------------------------------
  // TỔNG KẾT
  // ----------------------------------------------------------
  // class Foo {}              → class cơ bản
  // Foo(this.x)               → constructor ngắn gọn
  // Foo.named()               → named constructor
  // get area => ...           → getter
  // set value(v) { ... }      → setter
  // extends                   → kế thừa (1 class cha)
  // @override                 → ghi đè phương thức cha
  // abstract class            → không tạo object trực tiếp được
  // implements                → ký hợp đồng hành vi (nhiều interface)
}
