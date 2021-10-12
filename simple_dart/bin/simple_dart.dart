/* 1. A basic Dart program */
// Define a function.
void printInteger(int aNumber) {
  print('This number is $aNumber. ');
}

/* 2. Important concepts */
/* 
 * Everything you can place in a variable is an object, 
 * and every object is an instance of a class
 * ...
 */

/* 3. Keywords */
/* abstract   else      import      show
 * as         enum	    in	        static
 * assert     export    interface   super
 * async      extends	  is	        switch
 * ...
 */

/* 4. Variables */
void variableTest() {
  // Creating and initializing
  va
  r name1 = 'Alice'; // a reference to a String object.
  Object name2 = 'Bob'; // ont only String object, can specify the Object type
  String name3 = 'Cindy'; // explicitly declare the type that would be inferred
  print("var name $name1, Object name $name2, String name $name3");

  // Default value
  int? lineCount1; // ? means it is a nullable type, have an initial value null.
  assert(lineCount1 == null); // condition is true, bothing happen
  int lineCount2; // must initialize non-nullable variables before use(null safety)
  lineCount2 = 42; // don’t have to initialize avariable where it’s declared
  print(lineCount2); // Dart can detect that lineCount2 is non-null when print

  // Late variables
  late String slogan; // can't always know variable is non-null, here comes late
  slogan = 'Geronino!';
  print(slogan);
  /* late String temperature = _readThermometer(); // late combined initialization
   * the initializer only run when variable is uesd, which means don't need to 
   * initializing a expensive function _readThermometer() 
   * if temperature variable is never used(lazy initialization is handy) */

  // Final and const
  final name = 'Bob'; // without a type annotation, final can be set only once
  final String nickname = 'Bobby'; // you can’t change a final variable' value
  print("a guy named $name has a nickname $nickname");
  const centibar = 1000000; // unit of pressure (dynes/cm2)
  const double atm = 1.01325 * centibar; // standard atmosphere
  print("the unit of pressur is $centibar, the atmosphere is $atm");
  var foo = const []; // can also use it to create constant values
  final bar = const []; // actually can omit const for final variables
  const baz = []; // equivalent to `const []`
  foo = [1, 2, 3]; // was const [], but change to [1, 2, 3]
  // bar = [42]; // unlike foo, you can’t change the value of a const variable
  const Object i = 3; // where i is a const Object with an int value...
  const list = [i as int]; // use a typecast.
  const map = {if (i is int) i: 'int'}; // use is and collection if.
  const set = {if (list is List<int>) ...list}; // ...and a spread.
}

/* 5. Built-in types */
void builtInTest() {
  /* Number */
  var x = 1;
  var hex = 0xDEADBEEF;
  var y = 1.1;
  var exponent = 1.42e5;
  print('Integer: $x, Float: $y,  HEX: $hex, EXPONET: $exponent ');
  num n = 1; // x can have both int and double values
  print("now n'type is " + n.runtimeType.toString());
  n += 2.5;
  print("now n'type is " + n.runtimeType.toString());
  double z = 1; // equivalent to double z = 1.0.
  print("the value of z is: $z");
  var one = int.parse('1'); // String -> int
  print("one is a " + one.runtimeType.toString() + "type");
  var onePointOne = double.parse('1.1'); // String -> double
  print("onePointOne is a " + onePointOne.runtimeType.toString() + "type");
  String oneAsString = 1.toString(); // int -> String
  print("oneAsString is a " + oneAsString.runtimeType.toString() + "type");
  String piAsString = 3.14159.toStringAsFixed(2); // double -> String
  print("piAsString is a " + piAsString.runtimeType.toString() + "type");
}

// This is where the app starts executing.
void main(List<String> arguments) {
  var number = 42; // Declare and initialize a variable.
  printInteger(number); // Call a function.
  variableTest();
  builtInTest();
}
