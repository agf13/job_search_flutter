class JobText {
  static String normalizeWhitespace(String value) =>
      value.replaceAll(RegExp(r'\s+'), ' ').trim();
}
