enum FieldMask { DECIMAL, DATE, NONE }

extension Extensions on String {
  FieldMask toFieldMask() {
    switch (this.toLowerCase()) {
      case 'decimal':
        return FieldMask.DECIMAL;
      case 'date':
        return FieldMask.DATE;
      case 'none':
        return FieldMask.NONE;
      default:
        return FieldMask.NONE;
    }
  }
}
