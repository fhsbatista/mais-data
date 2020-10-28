import 'package:flutter/material.dart';
import 'package:maisdata/model/field.dart';
import 'package:maisdata/model/field_type.dart';
import 'package:maisdata/shared/colors.dart';

class AddField extends StatefulWidget {
  final Function(Field) onSubmit;

  AddField({@required this.onSubmit});

  @override
  _AddFieldState createState() => _AddFieldState();
}

class _AddFieldState extends State<AddField> {
  final labelController = TextEditingController();
  final labelFocus = FocusNode();
  final helperController = TextEditingController();
  final helperFocus = FocusNode();
  bool isRequired = false;
  FieldType fieldType;

  _onSubmit(BuildContext context) {
    final label = labelController.text;
    final helper = helperController.text;

    if (label.isEmpty || helper.isEmpty) {
      return;
    }

    widget.onSubmit(Field(
      label: label,
      helper: helper,
      isRequired: isRequired,
      type: fieldType,
    ));
    Navigator.pop(context);
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
        _InputField('Nome do campo', labelController, labelFocus, helperFocus),
        _InputField('Dica', helperController, helperFocus, null),
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
                  child: Text(type.description),
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

  Container _InputField(String name, TextEditingController controller,
      FocusNode focusNode, FocusNode nextFocus) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: name,
        ),
        textInputAction:
            (nextFocus != null) ? TextInputAction.next : TextInputAction.done,
        focusNode: focusNode,
        onFieldSubmitted: (value) {
          focusNode.unfocus();
          if (nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
      ),
    );
  }
}
