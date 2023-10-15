class UserModel {
  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.job,
    this.description,
    this.email,
    this.phone,
    this.password,
    this.image,
    this.liked,
  });

  UserModel.fromJson(dynamic json) {
    id = json['Id'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    job = json['Job'];
    description = json['Description'];
    email = json['Email'];
    phone = json['Phone'];
    password = json['Password'];
    image = json['Image'];
    liked = json['Liked'];
  }

  int? id;
  String? firstName;
  String? lastName;
  String? job;
  String? description;
  String? email;
  String? phone;
  String? password;
  String? image;
  int? liked;

  bool get isLiked => liked != null && liked !> 0;

  UserModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? job,
    String? description,
    String? email,
    String? phone,
    String? password,
    String? image,
    int? liked,
  }) =>
      UserModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        job: job ?? this.job,
        description: description ?? this.description,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        image: image ?? this.image,
        liked: liked ?? this.liked,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['FirstName'] = firstName;
    map['LastName'] = lastName;
    map['Job'] = job;
    map['Description'] = description;
    map['Email'] = email;
    map['Phone'] = phone;
    map['Password'] = password;
    map['Image'] = image;
    map['Liked'] = liked;
    return map;
  }
}