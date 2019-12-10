import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => new _DashboardState();
 }
class _DashboardState extends State<Dashboard> {
  @override
    Widget build(BuildContext context) {
    return   MaterialApp(
      title: 'json',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(title: Text('Peliculas'),),
        body: Center(
        ),
        drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              new ListTile(
                title: new Text('Cerrar Sesión'),
                onTap: (){
                   logout();
                },
              ),
              new ListTile(
                title: new Text('Productos'),
                onTap: (){
                   Navigator.pushNamedAndRemoveUntil(context, '/productos', (Route<dynamic> route)=> false);
                },
              )
            ],
            
          ),
          

         )
      ),
    
    );
    }
  void logout() async{ //cuando damos clic en logout borra todo lo de la preferences 
     SharedPreferences preferences = await SharedPreferences.getInstance();
     preferences.clear();
     /*Navigator.of(context).pushAndRemoveUntil(
       MaterialPageRoute(builder:(context) => Login()),
       (Route<dynamic> route) => false
     );*/
     Navigator.pop(context);
     Navigator.pushNamedAndRemoveUntil(context, '/login', (Route<dynamic> route)=> false);
  }
}