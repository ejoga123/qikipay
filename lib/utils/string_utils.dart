class StringUtils {
  static String removeWhitespace(String input) {
    return input.replaceAll(RegExp(r'\s+'), '');
  }

  static bool isNumeric(String input) {
    return double.tryParse(input) != null;
  }

  static String safeSubstring(String input, int start, [int? end]) {
    if (start >= input.length) return '';
    return input.substring(start, end ?? input.length);
  }

  static String maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;
    final visible = parts[0].substring(0, 2);
    return '$visible***@${parts[1]}';
  }

  static String pluralize(String word, int count) {
    return count == 1 ? word : '${word}s';
  }
}
