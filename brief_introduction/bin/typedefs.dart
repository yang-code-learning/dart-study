typedef IntList = List<int>;
IntList il = [1, 2, 3];

typedef ListMapper<X> = Map<X, List<X>>;
Map<String, List<String>> m1 = {}; // Verbose.
ListMapper<String> m2 = {}; // Same thing but shorter and clearer.

// function typedefs works
// but recommend using inline function 
// types instead of typedefs for functions
typedef Compare<T> = int Function(T a, T b);
int sort(int a, int b) => a - b;

void main(List<String> args) {
  assert(sort is Compare<int>); // True!
}
