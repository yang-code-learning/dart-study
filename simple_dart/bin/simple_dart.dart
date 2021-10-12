// 一个简单的 DART 程序
void printInteger(int aNumber) {
  print(' This number is $aNumber. ');
}

int _readThermometer() {
  return 42;
}

void variable() {
  // 变量
  var name1 = 'Bob';
  Object name2 = 'Bob';
  String name3 = 'Bob';

  print(' We got a var name $name1, Object name $name2, String name $name3');

  // 空安全
  int? lineCount;
  assert(lineCount == null);
  print(' 空安全断言通过 ');

  // 延迟赋值
  late String desc;
  desc = '山本';
  print(' 延迟赋值 $desc ');

  // 懒初始化
  late int temperature = _readThermometer();
  print(' Lazily Initialized: $temperature ');

  // 常量
  final name4 = 'Bob';
  print(' We got final name: $name4 ');

  // 编译时常量
  const bar1 = 10000;
  double atm = 3.14 * bar1;
  print(' We got 3.14 x const bar = $atm ');

  // 常量不可变
  var foo = [];
  final bar2 = const [];
  const baz = [];  // 等价于 const []

  foo = [1, 2, 3, 4];
  print(' Only var foo can change: $foo ');

  // 类型检查与强制类型转换
  const Object i = 42;
  const list = [i as int];
  print(' 强制类型转换 i as int: $list ');

  // map 生成和类型检查
  const map = {if (i is int) i: 'int'};
  print(' 类型检查 map: $map ');

  // 集合生成与类型检查
  const set = {if (list is List<int>) ...list};
  print(' 类型检查 集合: $set ');
}

// 内置类型
void builtIn() {
  // 整数，十六进制和指数(科学计数法)
  var x = 1;
  var f = 1.2;
  var hex = 0xDFA45236;
  var exponent = 8e5;

  print(' Integer: $x, Float: $f,  HEX: $hex, EXPONET: $exponent ');

  // num 类型可以是整数也可以是浮点数
  num n = 1;
  print(' Num 类型变量（存整数）: n = $n ');
  n = 1.2;
  print(' Num 类型变量（存浮点数）: n = $n ');

  // 字符串转num
  num a = int.parse('128');
  print(' 字符串 \'128\' 转 整数 128: $a ');

  // 数字转字符串
  int b = 128;
  String tmp = b.toString();
  print(' 数字 128 转 字符串 \'128\': $b ');
}

void main(List<String> arguments) {
  var number = 42;
  printInteger(number);

  variable();
  builtIn();
}