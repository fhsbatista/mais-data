import 'package:flutter/material.dart';
import 'package:maisdata/shared/colors.dart';
import 'package:maisdata/widgets/fields/Field.dart';

class AddField extends StatefulWidget {
  final Function(Field) onSubmit;

  AddField({@required this.onSubmit});

  @override
  _AddFieldState createState() => _AddFieldState();
}

class _AddFieldState extends State<AddField> {
  final labelController = TextEditingController();
  final helperController = TextEditingController();
  bool isRequired = false;
  FieldType fieldType = null;

  _onSubmit(BuildContext context) {
    final label = labelController.text;
    final helper = helperController.text;

    if (label.isEmpty || helper.isEmpty) {
      return;
    }

    widget.onSubmit(_Field(label, helper, isRequired, fieldType));
    Navigator.pop(context);
  }

  Field _Field(String label, String helper, bool isRequired, FieldType type) {
    return (FieldBuilder()
          ..setLabel(label)
          ..setHelper(helper)
          ..setType(type)
          ..isRequired = isRequired)
        .build();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Criar formulário',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        _InputField('Nome do campo', labelController),
        _InputField('Dica', helperController),
        _InputField('Dica', helperController),
        _InputField('Dica', helperController),
        _InputField('Dica', helperController),
        _InputField('Dica', helperController),
        DropdownButtonFormField(
          value: fieldType,
          decoration: InputDecoration(
            labelText: 'Selecione um tipo',
            border: OutlineInputBorder(),
          ),
          elevation: 16,
          onChanged: (value) {
            setState(() {
              fieldType = value;
            });
          },
          items: FieldType.values
              .map<DropdownMenuItem<FieldType>>(
                (type) => DropdownMenuItem<FieldType>(
                  value: type,
                  child: Text(type.getDescription()),
                ),
              )
              .toList(),
        ),
        CheckboxListTile(
          title: Text('Campo obrigatório?'),
          controlAffinity: ListTileControlAffinity.leading,
          value: isRequired,
          onChanged: (isChecked) {
            setState(() {
              isRequired = isChecked;
            });
          },
        ),
        Container(
          width: double.infinity,
          child: RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 16),
            color: kPrimaryColor,
            child: Text(
              'Salvar',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => _onSubmit(context),
          ),
        ),
      ],
    );
  }

  Container _InputField(String name, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: name,
        ),
      ),
    );
  }
}
