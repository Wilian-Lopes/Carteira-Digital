class Saidas {
  int ano;
  String mes;
  String categoria;
  double valor;
  String identificador;
  int vencimento;
  bool repetir;

  Saidas(
      {required this.ano,
      required this.mes,
      required this.categoria,
      required this.valor,
      required this.identificador,
      required this.vencimento,
      required this.repetir});

  static List<Saidas> listaSaidas = [];
}
