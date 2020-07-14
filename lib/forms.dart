import 'model/field.dart';

List<Field> fuelFields = [
  Field(
    label: 'Data do abastecimento',
    isRequired: true,
    mask: FieldMask.DATE,
    type: FieldType.DATE,
  ),
  Field(
    label: 'Frota abastecida',
    isRequired: true,
    keyboardType: FieldKeyboardType.NUMBER,
  ),
  Field(label: 'Nome do frentista', isRequired: true, type: FieldType.NAME),
  Field(label: 'Nome do motorista', isRequired: true, type: FieldType.NAME),
  Field(
      label: 'Ponto de Abastecimento', isRequired: true, type: FieldType.NAME),
  Field(
      label: 'Hodômetro',
      isRequired: true,
      type: FieldType.QUANTITY,
      mask: FieldMask.DECIMAL),
  Field(
      label: 'Litros',
      isRequired: true,
      type: FieldType.QUANTITY,
      mask: FieldMask.DECIMAL),
];
