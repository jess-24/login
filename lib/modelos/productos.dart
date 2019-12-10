class Productos {
  int id;
  String nomproducto;
  double costo;
  double precio;
  int existencia;
  int reorden;
  int comprometidas;
  bool vigente;
  String imagen;



  Productos({
    this.id,
    this.nomproducto,
    this.costo,
    this.precio,
    this.existencia,
    this.reorden,
    this.comprometidas,
    this.vigente,
    this.imagen,
  });

  factory Productos.fromJson(Map jsonMap){
    return Productos(
      id: jsonMap['id'],
      nomproducto: jsonMap['nomproducto'],
      costo: jsonMap['costo'],
      precio: jsonMap['precio'],
      existencia: jsonMap['existencia'],
      reorden: jsonMap['reorden'],
      comprometidas: jsonMap['comprometidas'],
      vigente: jsonMap['vigente'],
      imagen: jsonMap['imagen'],
    );
  }
}

class ListaProductos {

  List<Productos> productos;

  ListaProductos({
    this.productos,
  });

  factory ListaProductos.fromJson(List<dynamic> jsonList){
    List<Productos> productos = new List<Productos>();
    productos = jsonList.map((i) => Productos.fromJson(i)).toList();
    return ListaProductos(
        productos: productos
    );
  }
}