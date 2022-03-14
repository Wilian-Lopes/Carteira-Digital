import 'package:flutter/material.dart';
import 'listas.dart';
import 'main.dart';

class ListaDeSaidas extends StatefulWidget {
  //const ListaDeSaidas({Key? key}) : super(key: key);

  @override
  SaidasState createState() => SaidasState();
}

class SaidasState extends State<ListaDeSaidas> {
  final listaSaidas = Saidas.listaSaidas;

  int ano = 2021;
  String mes = "Janeiro";
  String categoria = "Casa";
  double valor = 59.98;
  String identificador = "Energia Elétrica";
  int vencimento = 10;
  bool repetir = true;

  var contextLista;

  void removeItem(String item) {
    //listaSaidas.remove(item);

    //print(item);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaSaidas.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: const EdgeInsets.only(top: 2, bottom: 0, left: 4, right: 4),
          //color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            padding: EdgeInsets.only(left: 5, right: 0),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // --------------- Valor -----------

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(80, 40),
                    //fixedSize: const Size(90, 30),
                    textStyle: TextStyle(
                      fontSize: 14,
                    ),
                    padding: EdgeInsets.all(5),
                  ),
                  onPressed: () {
                    //Abre um alert com TextFild
                    setState(() {
                      listaSaidas[index].valor += listaSaidas[index].valor;
                    });
                  },
                  child: Text(
                    "R\$ ${listaSaidas[index].valor.toStringAsFixed(2)}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                // --------------- Descrição -----------
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        listaSaidas[index].identificador =
                            "#MAX 20 CARACTERES#";
                      });
                    },
                    child: Text(
                      listaSaidas[index].identificador,

                      //style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                // --------------- Vencimento -----------
                Container(
                  alignment: Alignment.center,
                  //color: Colors.pink,
                  margin: EdgeInsets.all(0),
                  height: 35,
                  width: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Vencimento",
                        style: TextStyle(color: Colors.blue, fontSize: 10),
                      ),
                      Text(
                        " ${listaSaidas[index].vencimento}",
                        style: const TextStyle(
                            /*color: Colors.blue,*/ fontSize: 14),
                      ),
                    ],
                  ),
                ),
                // --------------- Repetir -----------
                IconButton(
                  onPressed: () {
                    setState(() {
                      listaSaidas[index].repetir = !listaSaidas[index].repetir;
                    });
                  },
                  icon: Icon(
                    !listaSaidas[index].repetir ? Icons.repeat : Icons.repeat,
                    color: listaSaidas[index].repetir
                        ? Colors.redAccent[400]
                        : Colors.black38,
                  ),
                ),

                // --------------- Deletar -----------
                IconButton(
                  onPressed: () {
                    setState(() {
                      //print(index);

                      //print(listaSaidas[index].identificador);
                      // removeItem(listaSaidas[index].identificador);
                      // listaSaidas[index].identificador = "alterando";
                      // listaSaidas[index].valor = 500.00;
                      // listaSaidas[index].vencimento = 10;
                      // listaSaidas[index];
                      listaSaidas.remove(listaSaidas[index]);
                    });
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
