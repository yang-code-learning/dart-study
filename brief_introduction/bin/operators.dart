void arithmeticTest() {
  // the usual arithmetic operators
  assert(2 + 3 == 5);
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5); // Result is a double
  assert(5 ~/ 2 == 2); // Result is an int
  assert(5 % 2 == 1); // Remainder

  assert('5/2 = ${5 ~/ 2} r ${5 % 2}' == '5/2 = 2 r 1');

  // prefix and postfix increment and decrement operators
  int a;
  int b;

  a = 0;
  b = ++a; // Increment a before b gets its value.
  assert(a == b); // 1 == 1

  a = 0;
  b = a++; // Increment a AFTER b gets its value.
  assert(a != b); // 1 != 0

  a = 0;
  b = --a; // Decrement a before b gets its value.
  assert(a == b); // -1 == -1

  a = 0;
  b = a--; // Decrement a AFTER b gets its value.
  assert(a != b); // -1 != 0
}

void relationalTest() {
  assert(2 == 2);
  assert(2 != 3);
  assert(3 > 2);
  assert(2 < 3);
  assert(3 >= 3);
  assert(2 <= 3);
}

class Person {
  late String firstName;
}

void typeTest() {
  var employee = Person();
  // (employee as Person).firstName = 'Bob';
  if (employee is Person) {
    // Type check
    employee.firstName = 'Bob';
  }
  print(employee.firstName);
}

void assignmentTest() {
  // assign values using the = operator
  var value = 2;
  var a = 0;
  int? b;
  // var c = 3;
  // Assign value to a
  a = value;
  // Assign value to b if b is null; otherwise, b stays the same
  b ??= value;
  // c ??= value; // the non-null var with pop a warnging
  print("$a, $b");

  // compound assignment
  var d = 2; // Assign using =
  d *= 3; // Assign and multiply: a = a * 3
  assert(d == 6);
}

void logicalTest() {
  var done = false;
  var col = 0;
  if (!done && (col == 0 || col == 3)) {
    print("..Do something...");
  }
}

void bitwiseShiftTest() {
  final value = 0x22;
  final bitmask = 0x0f;

  assert((value & bitmask) == 0x02); // AND
  assert((value & ~bitmask) == 0x20); // AND NOT
  assert((value | bitmask) == 0x2f); // OR
  assert((value ^ bitmask) == 0x2d); // XOR
  assert((value << 4) == 0x220); // Shift left
  assert((value >> 4) == 0x02); // Shift right
  assert((value >>> 4) == 0x02); // Unsigned shift right
  assert((-value >> 4) == -0x03); // Shift right
  assert((-value >>> 4) > 0); // Unsigned shift right
}

void conditionalTest() {
  // condition ? expr1 : expr2
  var isPublic = true;
  var visibility = isPublic ? 'public' : 'private';
  print(visibility);

  // expr1 ?? expr2
  String? name;
  String playerName(String? name) => name ?? 'Guest';
  print(playerName(name));

  // Slightly longer version uses ?: operator.
  // ignore: prefer_if_null_operators
  String playerName1(String? name) => name != null ? name : 'Guest';
  print(playerName1(name));
  // Very long version uses if-else statement.
  String playerName2(String? name) {
    if (name != null) {
      return name;
    } else {
      return 'Guest';
    }
  }
   print(playerName2(name));
}

class Paint {
  var color = 0;
  var strokeCap = 0;
  var strokeWidth = 0.0;
}

class Colors {
  static var black = 0;
  static var white = 255;
}

class StrokeCap {
  static var round = 0;
  static var square = 1;
  static var trangle = 2;
}


void cascadeTest() {
  // make a sequence of operations on the same object
  var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0;
  print("${paint.color}, ${paint.strokeCap}, ${paint.strokeWidth}");

  // equivalent to this code
  /* 
   * var paint = Paint();
   * paint.color = Colors.black;
   * paint.strokeCap = StrokeCap.round;
   * paint.strokeWidth = 5.0;
   */

  // object that the cascade operates on can be null, 
  // then use a null-shorting cascade (?..)
  /* 
   * querySelector('#confirm') // Get an object.
   *   ?..text = 'Confirm' // Use its members.
   *   ..classes.add('important')
   *   ..onClick.listen((e) => window.alert('Confirmed!'));
   */

  // The previous code is equivalent to the following:
  /* 
   * var button = querySelector('#confirm');
   * button?.text = 'Confirm';
   * button?.classes.add('important');
   * button?.onClick.listen((e) => window.alert('Confirmed!'));
   */

  // also nest cascades
  /* 
   * final addressBook = (AddressBookBuilder()
   *       ..name = 'jenny'
   *       ..email = 'jenny@example.com'
   *       ..phone = (PhoneNumberBuilder()
   *             ..number = '415-555-0100'
   *             ..label = 'home')
   *           .build())
   *     .build();
   */

  // Be careful on a function that returns an actual object
  /* 
   * var sb = StringBuffer();
   * sb.write('foo')
   *   ..write('bar'); // Error: method 'write' isn't defined for 'void'.
   */
}

void otherTest() {
  /* 
   * Operator	  Name	                      Meaning
   * ()	        Function application	      Represents a function call
   * []	        List access	                Refers to the value at the specified index in the list
   * .	        Member access	              Refers to a property of an expression
   * ?.	        Conditional member access	  Like ., but the leftmost operand can be null
   */
}

void main(List<String> args) {
  arithmeticTest();
  relationalTest();
  typeTest();
  assignmentTest();
  conditionalTest();
  cascadeTest();
  otherTest();
}
