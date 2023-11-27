// //abstract class animal
// abstract class Animal {
//   final String name;
//   final int numberOfLegs;
//   final bool canFly;

//   Animal({
//     required this.name,
//     required this.numberOfLegs,
//     required this.canFly,
//   });
// }

// //Dog extends animal
// class Dog extends Animal {
//   final Breed breed;
//   Dog({
//     required String name,
//     required int numberOfLegs,
//     required bool canFly,
//     required this.breed,
//   }) : super(
//           name: name,
//           numberOfLegs: numberOfLegs,
//           canFly: canFly,
//         );
// }

// //Cat extends animal
// class Cat extends Animal {
//   Cat({
//     required String name,
//     required int numberOfLegs,
//     required bool canFly,
//   }) : super(
//           name: name,
//           numberOfLegs: numberOfLegs,
//           canFly: canFly,
//         );
// }

// //Bird extends animal
// class Bird extends Animal {
//   Bird({
//     required String name,
//     required int numberOfLegs,
//     required bool canFly,
//   }) : super(
//           name: name,
//           numberOfLegs: numberOfLegs,
//           canFly: canFly,
//         );
// }

// //Pattern Matching using switch expression
// String getAnimalName(Animal animal) {
//   return switch (animal) {
//     Dog() => 'This is a dog its name is ${animal.name}',
//     //Using the WHEN keyword
//     Dog() when animal.breed == Breed.labrador => 'This is a labrador',
//     Cat() => 'This is a cat its name is ${animal.name}',
//     Bird() => 'This is a bird its name is ${animal.name}',
//     //Exhaustiveness checking using the wild card pattern
//     _ => 'This is an animal, but I don\'t know what it is',
//   };
// }

// void main() {
//   Animal animal = Dog(
//     name: 'Rex',
//     numberOfLegs: 4,
//     canFly: false,
//     breed: Breed.labrador,
//   );
//   print(getAnimalName(animal));
//   //OUTPUT: This is a labrador

//   Animal animal2 = Cat(
//     name: 'Tom',
//     numberOfLegs: 4,
//     canFly: false,
//   );

//   print(getAnimalName(animal2));
//   //OUTPUT: This is a cat its name is Tom
// }

// enum Breed {
//   pug,
//   germanShepherd,
//   labrador,
// }

// void main() {
//   Animal animal2 = Cat(
//     name: 'Tom',
//     numberOfLegs: 4,
//     canFly: false,
//   );

//   if (animal2 case Cat(:var name, :var numberOfLegs, :var canFly)) {
//     print(
//       '''This is a cat its name is $name
//     It has $numberOfLegs legs,
//     It can fly: $canFly''',
//     );
//     //OUTPUT: This is a cat its name is Tom It has 4 legs, It can fly: false
//   }

//   Map<String, int> hist = {
//     'a': 23,
//     'b': 100,
//   };

//   for (var MapEntry(key: key, value: count) in hist.entries) {
//     print('$key occurred $count times');
//   }
// }

// void main() {
//   List<int> items = [
//     1,
//     2,
//     3,
//   ];
//   var [a, b, c] = items;
//   print('$a, $b, $c');
//   //OUTPUT: 1, 2, 3var (String name, int height) = userInfo({'name': 'Michael', 'height': 180});
//   print('User $name is $height cm tall.');
// }

// sealed class Shape {}

// class Square implements Shape {
//   final double length;
//   Square(this.length);
// }

// class Circle implements Shape {
//   final double radius;
//   Circle(this.radius);
// }

// double calculateArea(Shape shape) => switch (shape) {
//       Square(length: var l) => l * l,
//       Circle(radius: var r) => math.pi * r * r
//     };

// class Something {
//   final String a;
//   final String b;
//   final String c;

//   Something({
//     required this.a,
//     required this.b,
//     required this.c,
//   });
// }

// Something returnSomething() {
//   return Something(
//     a: 'first',
//     b: 'second',
//     c: 'third',
//   );
// }

// void main() {
//   final something = returnSomething();
//   print('${something.a}, ${something.b}, ${something.c}');
//   //OUTPUT: first, second, third
// }

// ({String a, String b, String c}) returnSomething2() {
//   return (
//     a: 'first',
//     b: 'second',
//     c: 'third',
//   );
// }

// void main() {
//   final something = returnSomething2();
//   print('${something.a}, ${something.b}, ${something.c}');
//   //OUTPUT: first, second, third
// }



// var record = ('first', a: 2, b: true, 'last');
// print(record);
// //OUTPUT: (first, last, a: 2, b: true)

