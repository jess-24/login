import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:login/commons/httphandler.dart';
import 'modelos/productos.dart';

class listaDecoraciones extends StatelessWidget {

  final Productos productos;
  listaDecoraciones({
    this.productos
  });

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: const Color(0xFF333C45),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 160,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                productos.nomproducto,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              background: Image.network(
                productos.imagen,
                fit: BoxFit.fill,
              ),
            ),
            elevation: 5.0,
          ),
          SliverFillRemaining(
              child: Container(
                padding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    top: 20.0
                ),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width,
                      height: 40,
                      child: RaisedButton.icon(
                        label: Text('Comprar boletos'),
                        icon: Icon(Icons.play_arrow),
                        //onPressed: () =>{Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Read_form())};
                        color: Colors.blue,
                        textColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      productos.costo.toString(),
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}