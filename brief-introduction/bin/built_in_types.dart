void numberTest() {
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
}

void stringTest() {
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

  // here do NOT work in a const string(it's ok with var in invalidConstString).
  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = [1, 2, 3];
  var invalidConstString = '$aNum $aBool $aString $aConstList';
  print(invalidConstString);
}

void booleanTest() {
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
}

void listTest() {
  /* Lists */
  var list1 = [1, 2, 3]; // regular list<int>
  var list2 = [
    'Car',
    'Boat',
    'Plane',
  ]; // can add a comma after the last item
  print("list1: $list1, list2: $list2");

  // get a list’s length
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);

  list[1] = 1;
  assert(list[1] == 1);

  // using collection if to create a list
  var promoActive = true;
  var nav = [
    'Home',
    'Furniture',
    'Plants',
    if (promoActive) 'Outlet',
  ];
  print(nav);

  // using collection for to manipulate the items of a list
  var listOfInts = [1, 2, 3];
  var listOfStrings = [
    '#0',
    for (var i in listOfInts) '#$i',
  ];
  print(listOfStrings);
}

void setTest() {
  /* Sets */
}

void main(List<String> arguments) {
  numberTest();
  stringTest();
  booleanTest();
  listTest();
}
