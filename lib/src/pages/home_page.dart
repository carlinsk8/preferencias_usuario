import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_prefs/preferens_user.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  
  static final String routeName = 'home';
  final prefs = new PreferensUser();

  @override
  Widget build(BuildContext context) {
    prefs.pageLast = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuarios'),
        backgroundColor: prefs.color ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color segundario: ${prefs.color}'),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre de usuario: ${prefs.nombre}')
        ],
      ),
    );
  }
  
}