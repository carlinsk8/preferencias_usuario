import 'package:shared_preferences/shared_preferences.dart';


class PreferensUser {

  static final PreferensUser _instancia = new PreferensUser._internal();

  factory PreferensUser(){
    return _instancia;
  }

  PreferensUser._internal();

  SharedPreferences _prefs;

  initPrefs() async{
    this._prefs = await SharedPreferences.getInstance();
  }
  // bool _colorSegundario;
  // int _genero;
  // String _nombre;

  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value){
    _prefs.setInt('genero', value);
  }

  get color {
    return _prefs.getBool('color') ?? false;
  }

  set color(bool value){
    _prefs.setBool('color', value);
  }

  get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre(String value){
    _prefs.setString('nombre', value);
  }

  get pageLast {
    return _prefs.getString('pageLast') ?? 'home';
  }

  set pageLast(String value){
    _prefs.setString('pageLast', value);
  }
  
}