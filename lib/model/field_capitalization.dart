enum FieldCapitalization { WORDS, SENTENCES, CHARS, NONE }

extension Extensions on String {
  FieldCapitalization toFieldCapitalization() {
    switch (this.toLowerCase()) {
      case 'words':
        return FieldCapitalization.WORDS;
      case 'sentences':
        return FieldCapitalization.SENTENCES;
      case 'chars':
        return FieldCapitalization.CHARS;
      case 'none':
        return FieldCapitalization.NONE;
      default:
        return FieldCapitalization.NONE;
    }
  }
}
