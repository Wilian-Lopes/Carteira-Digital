import 'package:flutter/material.dart';
import 'package:wallet_v1/screen_despesas.dart';
import 'listas.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  InfoState createState() => InfoState();
}

class InfoState extends State<Info> {
  double infoDespesas = 00.00;
  final listaSaidas2 = Saidas.listaSaidas;

  sommaTotalDespesas() {
    //setState(() {
    for (int i = 0; i <= Saidas.listaSaidas.length - 1; i++) {
      infoDespesas += listaSaidas2[i].valor;

      print(listaSaidas2[i].valor);
    }
    // });
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Despesas"),
                Text(
                  'R\$ ${infoDespesas}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Receitas"),
                Text(
                  'R\$ 00,00',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
