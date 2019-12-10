import 'package:flutter/material.dart';
import 'package:login/commons/httphandler.dart';

class Read_form extends StatefulWidget {
  Read_form({Key key}) : super(key: key);

  _Read_formState createState() => _Read_formState();
}

class _Read_formState extends State<Read_form> {

  List<Map> lista=new List();
  //final DBHelper = DataBaseHelper.instancia;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _consultar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('REGISTROS'),),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10,left: 10,right: 10),
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text('ID'),
            ),
            DataColumn(
              label: Text('NOMBRE'),
            ),
            DataColumn(
              label: Text('DIRECCION'),
            ),
          ],
          rows: lista.map((fila)=>DataRow(
              cells: [
                DataCell(Text(
                    '${fila['id']}'),
                  onTap: () =>_showDialog(
                    fila['id'],
                    fila['nomcliente'],
                    fila['dircliente'],
                  ),
                ),
                DataCell(
                    Text('${fila['nomcliente']}')
                ),
                DataCell(Text(
                    '${fila['dircliente']}'),
                  onTap: () =>_showDialog(
                    fila['id'],
                    fila['nomcliente'],
                    fila['dircliente'],
                  ),
                ),
              ]
          )).toList(),
        ),
      ),
    );
  }
  void _consultar() async{
    //final allRows = await DBHelper.listarTodos();
    setState(() {
      //allRows.forEach((row) => lista.add(row));
    });
  }
  void _showDialog(idCliente,nomCliente,dirCliente) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Editar"),
              onPressed: () {
               /* Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Update(
                  edadCliente: dirCliente,
                  nomCliente: nomCliente,
                  idCliente: idCliente,
                )));*/
              },
            ),
            new FlatButton(
              child: new Text("Eliminar"),
              onPressed: () {
                _eliminar(idCliente);
              },
            ),
          ],
        );
      },
    );
  }
  void _eliminar(idCliente) async{
    // Asumimos que solo hay un registro
    //final id = await DBHelper.noRegistros();
    //final rowsDeleted = await DBHelper.eliminar(idCliente);
    print('Se borró el registro $idCliente');
  }
}