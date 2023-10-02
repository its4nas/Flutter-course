class UserModel {
  UserModel({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.job, 
      this.description, 
      this.email, 
      this.password, 
      this.image,});

  UserModel.fromJson(dynamic json) {
    id = json['Id'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    job = json['Job'];
    description = json['Description'];
    email = json['Email'];
    password = json['Password'];
    image = json['Image'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? job;
  String? description;
  String? email;
  String? password;
  String? image;
UserModel copyWith({  int? id,
  String? firstName,
  String? lastName,
  String? job,
  String? description,
  String? email,
  String? password,
  String? image,
}) => UserModel(  id: id ?? this.id,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  job: job ?? this.job,
  description: description ?? this.description,
  email: email ?? this.email,
  password: password ?? this.password,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['FirstName'] = firstName;
    map['LastName'] = lastName;
    map['Job'] = job;
    map['Description'] = description;
    map['Email'] = email;
    map['Password'] = password;
    map['Image'] = image;
    return map;
  }

}