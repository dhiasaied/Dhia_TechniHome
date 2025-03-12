class Avis {
  int? id;
  int idUtil;
  double note;
  String commentaire;
  String date;

  Avis({
    this.id,
    required this.idUtil,
    required this.note,
    required this.commentaire,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_Util': idUtil,
      'note': note,
      'commentaire': commentaire,
      'date': date,
    };
  }

  factory Avis.fromMap(Map<String, dynamic> map) {
    return Avis(
      id: map['id'],
      idUtil: map['id_Util'],
      note: map['note'].toDouble(),
      commentaire: map['commentaire'],
      date: map['date'],
    );
  }
}
