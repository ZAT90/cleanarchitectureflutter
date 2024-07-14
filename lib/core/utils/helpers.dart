// bool isNullOrEmpty(dynamic value) {
//   if (value == null) {
//     return true;
//   }
//   if (value is String) {
//     return value.isEmpty;
//   }
//   if (value is List || value is Map || value is Set) {
//     return value.isEmpty;
//   }
//   return false;
// }

// extension NullableObjectExtensions on Object? {
//   bool get isNullOrEmpty {
//     if (this == null) return true;
//     if (this is String) return (this as String).isEmpty;
//     if (this is Iterable) return (this as Iterable).isEmpty;
//     if (this is Map) return (this as Map).isEmpty;
//     return false;
//   }
// }

// bool isNotNullOrEmpty(dynamic o) =>
//   o != null || "" != o;