import 'dart:math';

class Pointnull {
  /* 4. Instance variables */
  double? x; // Declare instance variable x, initially null.
  double? y; // Declare y, initially null.
}

class Point {
  /* 4. Instance variables */
  double x = 0;
  double y = 0;
  /* 5. Constructors */
  /* 
  Point(double x, double y) {
    // There's a better way to do this, stay tuned.
    this.x = x;
    this.y = y; 
  }
  */

  // Syntactic sugar for setting x and y
  // before the constructor body runs.
  Point(this.x, this.y);

  // Named constructor
  Point.origin(xOrigin, yOrigin)
      : x = xOrigin,
        y = yOrigin;

  // Initializer list sets instance variables before
  // the constructor body runs.
  Point.fromJson(Map<String, double> json)
      : x = json['x']!,
        y = json['y']! {
    print('In Point.fromJson(): ($x, $y)');
  }
  // During development, you can validate inputs
  // by using assert in the initializer list.
  Point.withAssert(this.x, this.y) : assert(x >= 0) {
    print('In Point.withAssert(): ($x, $y)');
  }
  // Redirecting constructors: constructor’s body is empty, with the constructor
  // call (using this instead of the class name) appearing after a colon (:).
  // Delegates to the main constructor.
  Point.alongXAxis(double x) : this(x, 0);

  double distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}

// Constant constructors
// define a const constructor and
// make sure that all instance variables are final.
class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);
  final double x, y;
  const ImmutablePoint(this.x, this.y);
}

/* 4. Instance variables */
class ProfileMark {
  // Instance variables can be final, in which case they must be set exactly once
  final String name;
  final DateTime start = DateTime.now();

  ProfileMark(this.name);
  ProfileMark.unnamed() : name = '';
  // If you need to assign the value of a final instance variable after the constructor
  // Use a factory constructor
  // Use late final, but be careful: a late final without an initializer adds a setter to the API.
}

/* 5. Constrcutor */
class Person {
  String? firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }
}

void main(List<String> args) {
  /* 1. Using class members */
  var p = Point(2, 2);
  // Get the value of y.
  assert(p.y == 2);
  // Invoke distanceTo() on p.
  double distance = p.distanceTo(Point(4, 4));
  print(distance);
  // If p is non-null, set a variable equal to its y value.
  // var a = p?.y;

  /* 2. Using constructors */
  // the new keyword before the constructor name is optional
  var p1 = Point(2, 2);
  var p2 = Point.fromJson({'x': 1, 'y': 2});
  print("${p1.x}, ${p1.y}");
  print("${p2.x}, ${p2.y}");

  // Constructing two identical compile-time constants results in a single, canonical instance
  var a = const ImmutablePoint(1, 1);
  var b = const ImmutablePoint(1, 1);
  assert(identical(a, b)); // They are the same instance!
  // Within a constant context, you can omit the const before a constructor or literal
  // Lots of const keywords here.
  /*
   * const pointAndLine = const {
   *     'point': const [const ImmutablePoint(0, 0)],
   *     'line': const [const ImmutablePoint(1, 10), const ImmutablePoint(-2, 11)],
   *   };
   */
  // Only one const, which establishes the constant context.
  // ignore: unused_local_variable
  const pointAndLine = {
    'point': [ImmutablePoint(0, 0)],
    'line': [ImmutablePoint(1, 10), ImmutablePoint(-2, 11)],
  };
  // If a constant constructor is outside of a constant context and is invoked without const, it creates a non-constant object
  var a1 = const ImmutablePoint(1, 1); // Creates a constant
  var b1 = ImmutablePoint(1, 1); // Does NOT create a constant
  assert(!identical(a1, b1)); // NOT the same instance!

  /* 3. Getting an object’s type */
  print('The type of a is ${a.runtimeType}');

  /* 4. Instance variables */
  // All uninitialized instance variables have the value null.
  var pointnull = Pointnull();
  pointnull.x = 4; // Use the setter method for x.
  assert(pointnull.x == 4); // Use the getter method for x.
  assert(pointnull.y == null); // Values default to null.

  /* 5. Constructors */
  // Default constructors: If you don’t declare a constructor, a default constructor is provided
  // Constructors aren’t inherited: ubclasses don’t inherit constructors from their superclass.
  // Named constructors: Use a named constructor to implement multiple constructors for a class or to provide extra clarity
  // Invoking a non-default superclass constructor
  var employee = Employee.fromJson({});
  print(employee);
  // Initializer list:
  // Redirecting constructors
  // Redirecting constructors
  // Factory constructors
}
