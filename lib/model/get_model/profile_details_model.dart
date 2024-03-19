class UserProfileDetailsModel {
    UserProfileDetailsModel({
        required this.id,
        required this.username,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.image,
    });

    final int? id;
    final String? username;
    final String? email;
    final String? firstName;
    final String? lastName;
    final String? gender;
    final String? image;

    factory UserProfileDetailsModel.fromJson(Map<String, dynamic> json){ 
        return UserProfileDetailsModel(
            id: json["id"],
            username: json["username"],
            email: json["email"],
            firstName: json["firstName"],
            lastName: json["lastName"],
            gender: json["gender"],
            image: json["image"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
    };

}
