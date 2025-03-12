class Rapport {
  int? id;
  int idTechnicien;
  String contenu;
  String dateRapport;

  Rapport({
    this.id,
    required this.idTechnicien,
    required this.contenu,
    required this.dateRapport,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_technicien': idTechnicien,
      'contenu': contenu,
      'date_rapport': dateRapport,
    };
  }

  factory Rapport.fromMap(Map<String, dynamic> map) {
    return Rapport(
      id: map['id'],
      idTechnicien: map['id_technicien'],
      contenu: map['contenu'],
      dateRapport: map['date_rapport'],
    );
  }
}
