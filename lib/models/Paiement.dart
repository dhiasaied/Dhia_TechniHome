class Paiement {
  int? id;
  int idUtil;
  double montant;
  String datePaiement;
  String modePaiement;

  Paiement({
    this.id,
    required this.idUtil,
    required this.montant,
    required this.datePaiement,
    required this.modePaiement,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_Util': idUtil,
      'montant': montant,
      'date_paiement': datePaiement,
      'mode_paiement': modePaiement,
    };
  }

  factory Paiement.fromMap(Map<String, dynamic> map) {
    return Paiement(
      id: map['id'],
      idUtil: map['id_Util'],
      montant: map['montant'].toDouble(),
      datePaiement: map['date_paiement'],
      modePaiement: map['mode_paiement'],
    );
  }
}
