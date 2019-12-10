import 'package:flutter/material.dart';
import 'package:login/modelos/productos.dart';
import 'package:login/listaDecoraciones.dart';
import 'package:login/commons/httphandler.dart';

class ListaProductosCat extends StatefulWidget {
  @override
  _ListaProductosCatState createState() => new _ListaProductosCatState();
}
class _ListaProductosCatState extends State<ListaProductosCat> {

  List<Productos> listProductoRamdom    = new List();
  List<Productos> listProductoAux    = new List();
  @override
  void initState(){
    super.initState();
    getProductosCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
                'Acción',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                )
            ),
          ),
          SizedBox(height: 7,),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listProductoRamdom.length,
              itemBuilder: (BuildContext context, int index){
                print("!!!!!!!!!index: $index");
                //for(int x=0; x<=listMovieRamdom.length;x++){
                if(listProductoRamdom[index].id==1){
                  //listMovieAux.add(listMovieRamdom[x]);
                  return ProductoItem(listProductoRamdom[index]);
                  //return MovieItem(listMovieAux[x]);}
                  //}
                }

                //return MovieItem(listMovieAux[x]);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
                'Anime',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                )
            ),
          ),
          SizedBox(height: 7,),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: listProductoRamdom.length,
              itemBuilder: (BuildContext context, int index){
                if (listProductoRamdom[index].id==2) {
                  return ProductoItem(listProductoRamdom[index]);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void getProductosCategorias() async {
    var movies = await HttpHandler().getAllProductos();
    setState(() {
      listProductoRamdom.addAll(movies);
    });
  }

}

class ProductoItem extends StatelessWidget {

  final Productos producto;
  ProductoItem(this.producto);

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
                  placeholder: "assets/images/logo_cine.jpg",
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