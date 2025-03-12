class Maison {
  int? id_Mai;
  int idImm;
  String numero;
  int nombreDePiece;

  Maison({this.id_Mai, required this.idImm, required this.numero, required this.nombreDePiece});

  Map<String, dynamic> toMap() {
    return {
      'id_Mai': id_Mai,
      'id_imm': idImm,
      'numero': numero,
      'nombre_de_piece': nombreDePiece,
    };
  }

  factory Maison.fromMap(Map<String, dynamic> map) {
    return Maison(
      id_Mai: map['id_Mai'],
      idImm: map['id_imm'],
      numero: map['numero'],
      nombreDePiece: map['nombre_de_piece'],
    );
  }
}
