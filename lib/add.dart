import 'package:flutter/material.dart';
import 'package:wallet_v1/screen_despesas.dart';
import 'listas.dart';
import 'main.dart';
import 'info.dart';

class AddScreen extends StatefulWidget {
  //const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var itemsCategoria = [
    'Categorias',
    'Casa',
    'Compras',
    'Educação',
    'Investimentos',
    'Alimentação',
    'Mercado',
    'Saúde',
    'Roupas',
    'Empréstimos',
  ];
  final descricao_informado = TextEditingController();
  var valor_informado = TextEditingController();
  DateTime data_informada = DateTime.now();
  var dropdownvalueCategorias = 'Categorias';
  var repetir = false;
  var tipo = "Despesa";

  var info = "Informações";
  final listaSaidas = Saidas.listaSaidas;

  static InfoState info2 = InfoState();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //-------------- Topo -----------------
          Container(
            padding: EdgeInsets.all(30),
            height: 200,
            width: double.infinity,
            color: Colors.lightBlue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tipo,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: Column(
              children: [
                // --------------------- Botoes Principais ----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: tipo == "Despesa" ? Colors.green : Colors.grey,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            tipo = "Despesa";
                          },
                        );
                      },
                      child: Text("Despesa"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: tipo == "Receita" ? Colors.green : Colors.grey,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            tipo = "Receita";
                          },
                        );
                      },
                      child: Text("Receita"),
                    ),
                  ],
                ),
                //-------------- DESCRIÇÃO -----------------

                TextFormField(
                  controller: descricao_informado, // Lê o textField
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Informe',
                    labelText: 'Descrição',
                  ),
                ),

                //-------------- VALOR -----------------

                TextFormField(
                  controller: valor_informado, // Lê o textField
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Qual o Valor?',
                    labelText: 'Valor (R\$)',
                  ),
                ),

                //-------------- CATEGORIA -----------------
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 30),
                  height: 80,
                  child: DropdownButton(
                    isExpanded: true,
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                    ),
                    //iconSize: 25,
                    items: itemsCategoria.map((String items) {
                      return DropdownMenuItem<String>(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        dropdownvalueCategorias = newValue.toString();
                      });
                    },
                    value: dropdownvalueCategorias,
                  ),
                ),
                //-------------- Data -----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "${data_informada.day.toString()} / ${data_informada.month.toString()} / ${data_informada.year.toString()}"),
                    RaisedButton(
                      onPressed: () async {
                        final dtPicker = await showDatePicker(
                          context: context,
                          initialDate: new DateTime.now(),
                          firstDate: new DateTime(2021),
                          lastDate: new DateTime(2100),
                        );
                        print(DateTime.now());

                        if (dtPicker != null && dtPicker != data_informada) {
                          setState(() {
                            data_informada = dtPicker;
                          });
                        }
                      },
                      color: Colors.red,
                      child: const Text(
                        "Data",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    Container(
                      height: 20,
                    ),
                    //-------------- Repetir Lançamento -----------------

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: repetir ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            repetir = !repetir;
                          },
                        );
                      },
                      child: Text("Repetir"),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                ),
                //-------------- Botão adicionar -----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        setState(
                          () {
                            listaSaidas.add(
                              Saidas(
                                  ano: data_informada.year,
                                  mes: data_informada.month.toString(),
                                  categoria: dropdownvalueCategorias,
                                  valor:
                                      double.tryParse(valor_informado.text) ??
                                          0.0,
                                  identificador:
                                      descricao_informado.text.toUpperCase(),
                                  vencimento: data_informada.day,
                                  repetir: repetir),
                            );
                            main();
                            Navigator.of(context).pop();
                            info2.sommaTotalDespesas();
                          },
                        );
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.lightBlue,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
