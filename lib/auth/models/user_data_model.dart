class UserDataModel{
  String? name;
  String ?email;
  String ?id;
  UserDataModel({
     this.email,
     this.name,
     this.id

  });
  UserDataModel.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'],
         email: json['email'],
          id: json['id'],
        );
        

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'email':email
    };
  }
}