import 'dart:convert';
import 'package:login/modelos/productos.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:login/modelos/productos.dart' as prefix0;

class HttpHandler{//clase todas las peticiones http
  String token;
  Future<bool> getLogin(username, password) async {
    try{
      //http.Response response = await http.get('http://192.168.43.64:8080/WSAPPCINE/apirest/WSUSUARIOS/validacion/$username/$password'); http://18.212.34.4:8000/admin/$usr/$pwd
      http.Response response = await http.get('http://18.212.34.4:8000/admin/$username/$password');
      Map<String, dynamic> map = jsonDecode(response.body);//response.headers;
      print('Bearer: ${map['token']}');
      //print('${response.body[0]}');
      print(response.statusCode.toString());
      //if(response.statusCode == 200){
      if((map['token'])!= "Autenticacion incorrecta"){
        token=map['token'];
        return true;
      }else{
        return false;}
    }catch(e){
      print('exception: '+e.toString());
      return false;
    }
  }
  Future<List<Productos>> getAllProductos() async {
    ListaProductos listaProductos;
    http.Response  response = await http.get( 'http://192.168.43.64:3000/api/wspeliculas/$token');

    try{
      if(response.statusCode == 200){
        final jsonResponse   = jsonDecode(response.body);
        print("*****************");
        print(jsonResponse['productos']);
        listaProductos = new ListaProductos.fromJson(jsonResponse['productos']);
      }
      else{
        listaProductos = new ListaProductos();
      }
    }catch(e){
      print(e.toString());
    }
    return listaProductos.productos;
  }
/*Future<List<Movies>> getAllPelciulasCat() async {
    ListaPeliculasCat listaPelculas;
    http.Response  response = await http.get( 'http://192.168.0.103:3000/api/wspeliculas/$token');

    try{
      if(response.statusCode == 200){
        final jsonResponse   = jsonDecode(response.body);
        print("*****************");
        print(jsonResponse['peliculas']);
        listaPelculas = new ListaPeliculasCat.fromJson(jsonResponse['peliculas']);
      }
      else{
        listaPelculas = new ListaPeliculasCat();
      }
    }catch(e){
      print(e.toString());
    }
    return listaPelculas.movies;
  }*/
/*Future<List<Movies>> getHorarios() async {
    Lista listaHorarios;
    http.Response  response = await http.get( 'http://192.168.0.103:3000//api/wshorarios/$id/$token');

    try{
      if(response.statusCode == 200){
        final jsonResponse   = jsonDecode(response.body);
        print(jsonResponse['horarios']);
        listaHorarios = new ListaPeliculas.fromJson(jsonResponse['horarios']);
      }
      else{
        listaHorarios = new ListaPeliculas();
      }
    }catch(e){
      print(e.toString());
    }
    return listaHorarios.movies;
  }
*/
}