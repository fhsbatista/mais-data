import 'package:maisdata/model/field_keyboard_type.dart';
import 'package:maisdata/model/field_mask.dart';
import 'package:maisdata/model/field_type.dart';

import 'model/field.dart';

List<Field> fuelFields = [
  Field(
    label: 'Data do abastecimento',
    isRequired: true,
    mask: FieldMask.DATE,
    type: Date(),
  ),
  Field(
    label: 'Frota abastecida',
    isRequired: true,
    keyboardType: FieldKeyboardType.NUMBER,
  ),
  Field(label: 'Nome do frentista', isRequired: true, type: Name()),
  Field(label: 'Nome do motorista', isRequired: true, type: Name()),
  Field(label: 'Ponto de Abastecimento', isRequired: true, type: Name()),
  Field(
      label: 'Hodômetro',
      isRequired: true,
      type: Quantity(),
      mask: FieldMask.DECIMAL),
  Field(
      label: 'Litros',
      isRequired: true,
      type: Quantity(),
      mask: FieldMask.DECIMAL),
];
