abstract class FieldType {
  String description;

  static FieldType stringToFieldType(String input) {
    switch (input.toLowerCase()) {
      case 'name':
        return Name();
      case 'quantity':
        return Quantity();
      case 'date':
        return Date();
      case 'notype':
        return NoType();
      default:
        return NoType();
    }
  }

  static List<FieldType> types = [
    Name(),
    Quantity(),
    Date(),
    NoType(),
  ];
}

class Name extends FieldType {
  @override
  String description = 'Nome';
}

class Quantity implements FieldType {
  @override
  String description = 'Quantidade';
}

class Date implements FieldType {
  @override
  String description = 'Data';
}

class NoType implements FieldType {
  @override
  String description = 'Sem Tipo';
}
