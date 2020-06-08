import 'package:maisdata/widgets/fields/Field.dart';

List<Field> fuelFields = [
  (FieldBuilder()
        ..isRequired = true
        ..setLabel('Data do abastecimento')
        ..setDateFormatter())
      .build(),
  (FieldBuilder()
        ..isRequired = true
        ..setLabel('Frota abastecida')
        ..setOnlyNumbersKeyboard())
      .build(),
  (FieldBuilder()
        ..isRequired = true
        ..setLabel('Nome do frentista'))
      .build(),
  (FieldBuilder()
        ..isRequired = true
        ..setLabel('Nome do Motorista'))
      .build(),
  (FieldBuilder()
        ..isRequired = true
        ..setLabel('Ponto de Abastecimento'))
      .build(),
  (FieldBuilder()
        ..isRequired = true
        ..setLabel('Hodômetro')
        ..setDecimalFormatter())
      .build(),
  (FieldBuilder()
        ..isRequired = true
        ..setLabel('Litros')
        ..setDecimalFormatter())
      .build(),
];
