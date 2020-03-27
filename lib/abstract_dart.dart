// Why do all types end with an underscore?
// - To not clash with dartz (https://pub.dev/packages/dartz) and other names for
// common concepts.
//
// What about other structures like Magmas, Rings, Semigroupoids, ...
// - They might describe some structures mathematically better,
//   but they seem, at the time of writing this, to be too verbose and complicated
//   for the intended use cases of this library..
//
library abstract_dart;

export 'src/hierarchy/base.dart';
export 'src/hierarchy/combined.dart';
export 'src/hierarchy/scalar.dart';
export 'src/implementation/base/fields.dart';
export 'src/implementation/base/groups.dart';
export 'src/implementation/base/monoids.dart';
export 'src/implementation/scalar/vector_spaces.dart';
