class Utilisateur {
  int? idutilisateur; 
  String nom;
  String prenom;
  String email;
  String motDePasse;
  String role;
  String status;
  String tel; 

  Utilisateur({
    this.idutilisateur, 
    required this.nom,
    required this.prenom,
    required this.email,
    required this.motDePasse,
    required this.role,
    required this.status,
    required this.tel, 
  });

  Map<String, dynamic> toMap() {
    return {
      'idutilisateur': idutilisateur, 
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'mot_de_passe': motDePasse,
      'role': role,
      'status': status,
      'tel': tel, 
    };
  }

  factory Utilisateur.fromMap(Map<String, dynamic> map) {
    return Utilisateur(
      idutilisateur: map['idutilisateur'], 
      nom: map['nom'],
      prenom: map['prenom'],
      email: map['email'],
      motDePasse: map['mot_de_passe'],
      role: map['role'],
      status: map['status'],
      tel: map['tel'],  
    );
  }
}
