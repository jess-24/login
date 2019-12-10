import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login/commons/httphandler.dart';
import 'Home.dart';

class Login extends StatefulWidget {

  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();

}

class _LoginState extends State<Login> {

  bool session;

  TextEditingController usuarioController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();

  final GlobalKey<ScaffoldState> _globalKey=new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,//todo el alto de la app
            decoration: BoxDecoration(//caja de decoraciones
                gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent,
                      Colors.black87,
                      Colors.blueAccent,
                    ],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    tileMode: TileMode.clamp
                )
            ),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  child: Image.asset('assets/images/icono.png'),
                  radius: 100,
                  backgroundColor: Colors.transparent,
                ),
                SizedBox( height: 30,),
                Theme(
                  data: ThemeData(
                    primaryColor: Colors.white,
                    hintColor: Colors.green[100],
                  ),
                  child: TextFormField(cursorColor: Colors.white10,
                    style: TextStyle(color: Colors.green[100]),
                    controller: usuarioController,//detecta el codigo que se escribe
                    decoration: InputDecoration(
                        labelText: 'User',labelStyle: TextStyle( fontFamily: 'Raleway'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(15),
                              right: Radius.circular(15),
                            )
                        )
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Theme(
                  data: ThemeData(
                    primaryColor: Colors.white,
                    hintColor: Colors.green[100],
                  ),
                  child: TextFormField(cursorColor: Colors.white10,
                    style: TextStyle(color: Colors.green[100]),
                    controller: passwordController,
                    obscureText: true, //oculte
                    decoration: InputDecoration(
                        labelText: 'Password',labelStyle: TextStyle( fontFamily: 'Raleway'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(15),
                              right: Radius.circular(15),
                            )
                        )
                    ),
                  ),
                ),
                SizedBox(height: 15,),
              /*  Theme(
                  data: ThemeData(
                    primaryColor: Colors.white,
                    hintColor: Colors.green[100],
                  ),
                  child:  Row(
                      children: <Widget>[
                          Checkbox(
                          activeColor: Colors.green,
                          value: saveData,
                          onChanged: (value){
                  setState(() {
                  saveData = value;
                  });
                  },
                    ),
              Text('Guardar datos')
                  ],
                    ),
                  ),
            SizedBox(height: 15,),*/
                ButtonTheme(
                  minWidth: double.infinity,
                  height: 50,
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                    highlightColor: Colors.green[300],
                    onPressed: () => _login(),
                    color: Colors.green[300],
                    child: Text("Login",
                      style: TextStyle(color: Colors.teal[900],fontSize: 20,fontStyle: FontStyle.normal,fontFamily: 'Raleway',),
                    ),
                    //shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(60.0)),
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.only(top: 30,left: 40,right: 40),
          ),
        )
    );
  }
  _login() async{
    bool statusOK= await HttpHandler().getLogin(usuarioController.text,  passwordController.text);
    if(statusOK){
      print(usuarioController.text);
      print(passwordController.text);
      // sin consumir if(usuarioController.text=='jess' && passwordController.text=='jess'){
      SharedPreferences preferences = await SharedPreferences.getInstance();//funcion asincrona para sharedpreferences
      preferences.setBool('sesion', true);//se crea preferencia sesion, se guarda la sesion activa
      //permite que al dar regresar se salga de la app y ya no muRestra el login
      Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (context) => Home()) ,
              (Route<dynamic> route) => false);
    }else{
      _showSnackBar('Usuario y/o contraseña incorrectos');
    }
  }
  _showSnackBar(String text){
    final snackBar = new SnackBar(
      content: Text(text),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.redAccent,
    );
    _globalKey.currentState.showSnackBar(snackBar);
  }
}
