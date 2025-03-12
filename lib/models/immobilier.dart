class Immobilier {
  int? idImm; 
  String nom;
  String adresse;
  String type;

  Immobilier({this.idImm, required this.nom, required this.adresse, required this.type});

  Map<String, dynamic> toMap() {
    return {
      'id_Imm': idImm, 
      'nom': nom,
      'adresse': adresse,
      'type': type,
    };
  }

  factory Immobilier.fromMap(Map<String, dynamic> map) {
    return Immobilier(
      idImm: map['id_Imm'],
      nom: map['nom'],
      adresse: map['adresse'],
      type: map['type'],
    );
  }
}
