extension StringExtensions on String {
  /// Capitalizes the first letter and makes the rest lowercase
  /// Example: "hello WORLD" -> "Hello world"
  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  /// Capitalizes only the first letter, keeps the rest as is
  /// Example: "hello WORLD" -> "Hello WORLD"
  String capitalizeFirst() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  /// Capitalizes the first letter of each word
  /// Example: "hello world" -> "Hello World"
  String capitalizeWords() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize()).join(' ');
  }

  /// Capitalizes the first letter of each word but keeps the rest as is
  /// Example: "hello WORLd" -> "Hello WORLd"
  String capitalizeFirstWords() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalizeFirst()).join(' ');
  }
}
