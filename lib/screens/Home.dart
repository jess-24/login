import 'package:flutter/material.dart';
import 'package:login/modelos/productos.dart';
import 'package:login/modelos/productos.dart' as prefix0;
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:login/listaProductos.dart';
import 'package:login/listaProductosCat.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //FirebaseMessaging firebaseMessaging= new FirebaseMessaging();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
     // _firebaseCloudMessaging();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child:new ListView(
          // Important: Remove any padding from the ListView.
          children: <Widget>[
            new Container(child: new DrawerHeader(child: new CircleAvatar(
              child: Image.network('https://i1.wp.com/conciertosguadalajara.com.mx/wp-content/uploads/2017/09/Bonus-geni.png?fit=1200%2C627&ssl=1'),
            )),color: Colors.cyan[900],
            ),
            new Container(
              child: new Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Comprar boletos'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // Update the state of the app
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text('Categorias'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: ()=> Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FirstPage())
                    ),

                  ),
                  ListTile(
                    title: Text('Cerrar Sesion'),
                    onTap: () {
                      logout();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),// We'll populate the Drawer in the next step!
      ),
      appBar: AppBar(
        title: Text('TIENDA JESS',textAlign: TextAlign.right,style: TextStyle(color: Colors.cyan[900],fontFamily: 'Raleway'),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app,color: Colors.cyan[900],size: 40,),
            padding: EdgeInsets.only(right: 20),
            onPressed: () {
              logout();
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(//caja de decoraciones
            gradient: LinearGradient(
                colors: [
                  Colors.blueAccent,
                  Colors.black54,
                  Colors.blueAccent,
                ],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                tileMode: TileMode.clamp
            )
        ),
        //height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.width,
        child: ListaProductosCat(),
        padding: EdgeInsets.only(top: 0.5,left: 15,right: 15),
        //ListaPeliculas(),
        /*children: <Widget>[
             RaisedButton(
              onPressed: () => logout(),
              child: Text('Cerrar Sesión'),
            ),
             ListaPeliculas(),
           ],*/

      ),
      /*Center(
         child:RaisedButton(
           onPressed: () => logout(),
           child: Text('Cerrar Sesión'),
         ),
       ),*/
    );
  }
  logout() async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.clear();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login()),
            (Route<dynamic> route) => false);
  }
  /*void _firebaseCloudMessaging() {

    firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          print('on message - $message');
        },
        onResume: (Map<String, dynamic> message) async {
          print('on resume $message');
        },
        onLaunch: (Map<String, dynamic> message) async {
          print('on launch - ${message['data']['click_action']}');
        }
    );
  }*/
  update(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token-firebase', token);
    print('Token firebase: ${preferences.get('token-firebase')}');
  }
}
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
      drawer: new Home(),
      appBar: AppBar(
        title: Text('TIENDA JESS',textAlign: TextAlign.right,style: TextStyle(color: Colors.cyan[900],fontFamily: 'Raleway'),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app,color: Colors.cyan[900],size: 40,),
            padding: EdgeInsets.only(right: 20),
            onPressed: () {
              //logout();
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(//caja de decoraciones
            gradient: LinearGradient(
                colors: [
                  Colors.blueAccent,
                  Colors.black54,
                  Colors.blueAccent,
                ],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                tileMode: TileMode.clamp
            )
        ),
        //height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.width,
        child: ListaProductosCat(),
        padding: EdgeInsets.only(top: 0.5,left: 15,right: 15),
        //ListaPeliculas(),
        /*children: <Widget>[
             RaisedButton(
              onPressed: () => logout(),
              child: Text('Cerrar Sesión'),
            ),
             ListaPeliculas(),
           ],*/

      ),
      /*Center(
         child:RaisedButton(
           onPressed: () => logout(),
           child: Text('Cerrar Sesión'),
         ),
       ),*/
    );
  }
}