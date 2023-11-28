userName(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a username';
  }
  return null;
}
