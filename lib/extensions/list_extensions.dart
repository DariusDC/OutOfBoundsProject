extension ListExtensions<T> on List<T> {
  bool equals(List<T>? other) {
    if (other == null) return true;
    if (other?.length != length) {
      return false;
    }
    for (int i = 0; i < length; i++) {
      if (this[i] != other![i]) {
        return false;
      }
    }
    return true;
  }

  T? firstWhereOrNull(bool Function(T element) test) {
    for (int i = 0; i < length; i++) {
      if (test(this[i])) {
        return this[i];
      }
    }
    return null;
  }
}
