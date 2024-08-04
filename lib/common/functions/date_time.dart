DateTime? tryParseDateTime(String dateString) {
  try {
    return DateTime.parse(dateString);
  } catch (e) {
    return null; // Or provide a default value if needed
  }
}