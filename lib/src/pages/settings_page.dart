import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_prefs/preferens_user.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _textController;
  final prefs = new PreferensUser();

  @override
  void initState() {
    super.initState();

    prefs.pageLast = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.color;
    _nombre = prefs.nombre;
    _textController = new TextEditingController(text: prefs.nombre);
  }

  _setSelectedRadio(valor) {

    prefs.genero = valor;
    _genero = valor;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: prefs.color ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings',style:TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: (value){
              setState(() {
                _colorSecundario=value;
                prefs.color = value;
              });
            }
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usuario'
              ),
              onChanged: (value){
                prefs.nombre=value;
              },
            ),
          )
        ],
      ),
    );
  }
}