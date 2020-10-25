enum FieldKeyboardType { TEXT, NUMBER, PHONE }

extension Extensions on String {
  FieldKeyboardType toFieldKeyboardType() {
    switch (this.toLowerCase()) {
      case 'text':
        return FieldKeyboardType.TEXT;
      case 'number':
        return FieldKeyboardType.NUMBER;
      case 'phone':
        return FieldKeyboardType.PHONE;
      default:
        return null;
    }
  }
}
