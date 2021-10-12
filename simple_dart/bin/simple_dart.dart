/* 1. A basic Dart program */
// Define a function.
void printInteger(int aNumber) {
  print('The answer to the ultimate question is $aNumber. ');
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
  /* Creating and initializing */
  var name1 = 'Alice'; // a reference to a String object.
  Object name2 = 'Bob'; // ont only String object, can specify the Object type
  String name3 = 'Cindy'; // explicitly declare the type that would be inferred
  print("var name $name1, Object name $name2, String name $name3");

  /* Default value */
  int? lineCount1; // ? means it is a nullable type, have an initial value null.
  assert(lineCount1 == null); // condition is true, nothing happen

  int lineCount2; // must initialize non-nullable variables before use(null safety)
  lineCount2 = 42; // don’t have to initialize avariable where it’s declared
  print(lineCount2); // Dart can detect that lineCount2 is non-null when print

  /* Late variables */
  late String slogan; // can't always know variable is non-null, here comes late
  slogan = 'Geronino!';
  print(slogan);
  /* late String temperature = _readThermometer(); // late combined initialization
   * the initializer only run when variable is uesd, which means don't need to 
   * initializing a expensive function _readThermometer() 
   * if temperature variable is never used(lazy initialization is handy) */

  /* Final and const */
  final name = 'Bob'; // without a type annotation, final can be set only once
  final String nickname = 'Bobby'; // you can’t change a final variable' value
  print("a guy named $name has a nickname $nickname");

  const centibar = 1000000; // unit of pressure (dynes/cm2)
  const double atm = 1.01325 * centibar; // standard atmosphere
  print("the unit of pressur is $centibar, the atmosphere is $atm");

  var foo = const [4, 5, 6]; // can also use it to create constant values
  final bar = const [0, 0, 0]; // actually can omit const for final variables
  const baz = [1, 1, 1]; // equivalent to `const [1, 1, 1]`
  print("foo = " +
      foo.toString() +
      ", bar = " +
      bar.toString() +
      ", baz = " +
      baz.toString());

  foo = [1, 2, 3]; // was const [], but change to [1, 2, 3]
  print("now foo=" + foo.toString());
  // bar = [42]; // unlike foo, you can’t change the value of a const variable

  const Object i = 3; // where i is a const Object with an int value...
  const list = [i as int]; // use a typecast.
  const map = {if (i is int) i: 'int'}; // use is and collection if.
  const set = {if (list is List<int>) ...list}; // ...and a spread.
  print("map = " + map.toString() + " and set = " + set.toString());
}

/* 5. Built-in types */
void builtInTest() {
  /* Number */
  var x = 1; // regular integar type
  var hex = 0xDEADBEEF; // integar type in hexadecimal
  var y = 1.1; // regular float type in scientific notation
  var exponent = 1.42e5; // float type in scientific notation
  print('Integer: $x, Float: $y,  HEX: $hex, EXPONET: $exponent ');

  num n = 1; // x can have both int and double values
  print("now the type of n is " + n.runtimeType.toString());
  n += 2.5;
  print("now the type of n is " + n.runtimeType.toString());

  double z = 1; // equivalent to double z = 1.0.
  print("the value of z is: $z");

  var one = int.parse('1'); // String -> int
  print("$one is a " + one.runtimeType.toString() + "type");
  var onePointOne = double.parse('1.1'); // String -> double
  print("$onePointOne is a " + onePointOne.runtimeType.toString() + "type");
  String oneAsString = 1.toString(); // int -> String
  print("$oneAsString is a " + oneAsString.runtimeType.toString() + "type");
  String piAsString = 3.14159.toStringAsFixed(2); // double -> String
  print("$piAsString is a " + piAsString.runtimeType.toString() + "type");

  print("bitwise shift: (3 << 1) = " + (3 << 1).toString()); // 0011 << 1 = 0110
  print("bitwise XOR: (3 | 4) = " + (3 | 4).toString()); // 0011 | 0100 = 0111
  print("bitwise AND: (3 & 4) = " + (3 & 4).toString()); // 0011 & 0100 = 0000

  /* String */
  /* var s1 = 'Single quotes work well for string literals.';
   * var s2 = "Double quotes work just as well.";
   * var s3 = 'It\'s easy to escape the string delimiter.';
   * var s4 = "It's even easier to use the other delimiter."; */
  var s = 'string interpolation';
  if ('That deserves all caps. ${s.toUpperCase()} is very handy!' ==
      'That deserves all caps. STRING INTERPOLATION is very handy!') {
    print('That deserves all caps. ${s.toUpperCase()} is very handy!');
  } // Two strings are equivalent if they contain the same sequence of code units.

  //concatenate strings using adjacent string literals or the + operator
  var s1 = 'String '
      'concatenation'
      " works even over line breaks.";
  if (s1 ==
      'String concatenation works even over '
          'line breaks.') {
    print(s1);
  }
  var s2 = 'The + operator works ' + 2.toString();
  if (s2 == 'The + operator works 2') {
    print(s2);
  }

  // Another way to create a multi-line string: use a triple quote
  var s3 = '''
  You can create
  multi-line strings like this one.
''';
  var s4 = """
  This is also a
  multi-line string.""";
  print("notice that the blank remains for each line!\n" + s3 + s4);

  // create a “raw” string by prefixing it with r:
  var s5 = r'In a raw string, not even \n gets special treatment.';
  print("a “raw” string: " + s5);

  // These work in a const string.
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';
  const validConstString = '$aConstNum $aConstBool $aConstString';
  print(validConstString);
  // These do NOT work in a const string(it's ok with var).
  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = [1, 2, 3];
  var invalidConstString = '$aNum $aBool $aString $aConstList';
  print(invalidConstString);

  /* Booleans */
  // Check for an empty string.
  var fullName = '';
  assert(fullName.isEmpty);
  // Check for zero.
  var hitPoints = 0;
  assert(hitPoints <= 0);
  // Check for null.
  // ignore: prefer_typing_uninitialized_variables
  var unicorn;
  assert(unicorn == null);
  // Check for NaN.
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);

  /* Lists */
  var list1 = [1, 2, 3]; // regular list<int>
  var list2 = [
    'Car',
    'Boat',
    'Plane',
  ]; // can add a comma after the last item
  print("list1: $list1, list2: $list2");
}

// This is where the app starts executing.
void main(List<String> arguments) {
  print("1. A basic Dart program");
  var number = 42; // Declare and initialize a variable.
  printInteger(number); // Call a function.
  print("\n4. Variable test");
  variableTest();
  print("\n5. Built-in type test");
  builtInTest();
}
