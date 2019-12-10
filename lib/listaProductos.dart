import 'package:flutter/material.dart';
import 'package:login/modelos/productos.dart';
import 'package:login/listaDecoraciones.dart';
import 'package:login/commons/httphandler.dart';
import 'package:login/modelos/productos.dart';

class ListaProductos extends StatefulWidget {
  @override
  _ListaProductosState createState() => new _ListaProductosState();
}
class _ListaProductosState extends State<ListaProductos> {

  List<Productos> listProductoRamdom    = new List();
  @override
  void initState(){
    super.initState();
    getProductos();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
                'Peliculas',
                style: TextStyle(
                    color: Colors.teal[900],
                    fontSize: 20
                )
            ),
          ),
          SizedBox(height: 7,),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listProductoRamdom.length,
              itemBuilder: (BuildContext context, int index){
                return MovieItem(listProductoRamdom[index]);
              },
            ),
          ),

        ],
      ),
    );
  }

  void getProductos() async {
    var movies = await HttpHandler().getAllProductos();
    setState(() {
      listProductoRamdom.addAll(movies);
    });
    print('Producto ${listProductoRamdom[0].nomproducto}');
  }

/*void getMoviesComedy() async {
    var movies = await HttpHandler().getMoviesComedy();
    setState(() {
      listMovieComedy.addAll(movies);
    });
    print('Titulo de la pelicula ${listMovieAction[19].title}');
  }

  void getMoviesHorror() async {
    var movies = await HttpHandler().getMoviesHorror();
    setState(() {
      listMovieHorror.addAll(movies);
    });
    print('Titulo de la pelicula ${listMovieAction[19].title}');
  }

  void getMoviesRomance() async {
    var movies = await HttpHandler().getMoviesRomance();
    setState(() {
      listMovieRomance.addAll(movies);
    });
    print('Titulo de la pelicula ${listMovieAction[19].title}');
  }*/

}

class MovieItem extends StatelessWidget {

  final Productos producto;
  MovieItem(this.producto);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2,
        child:GestureDetector(
          child: Card(
            margin: EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 10),
            color: Colors.transparent,
            child: Stack(
              children: <Widget>[
                new FadeInImage.assetNetwork(
                  placeholder: "assets/images/icono.png",
                  image:producto.imagen,
                  fit: BoxFit.fill, //Permite definir como se desplegará la imagen dentro del box
                  height: 190.0,
                  width: double.infinity,
                  fadeInDuration: new Duration(milliseconds: 40),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[850].withOpacity(0.5)
                    ),
                    constraints: BoxConstraints.expand(
                      height: 50,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 20,
                  width: 100,
                  child: Text(
                    producto.nomproducto,
                    style: TextStyle(
                        color: Colors.white
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 15,
                  //width: 30,
                  child: Row(
                    children: <Widget>[
                      Text(
                        '${producto.costo}',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => listaDecoraciones(productos: producto))
          ),
        )
    );
  }
}