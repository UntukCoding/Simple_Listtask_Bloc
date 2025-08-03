class Ambildatauser {
    Ambildatauser({
        required this.hasil,
    });

    final List<Hasil2> hasil;

    factory Ambildatauser.fromJson(Map<String, dynamic> json) => Ambildatauser(
        hasil: List<Hasil2>.from(json["hasil"].map((x) => Hasil2.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "hasil": List<dynamic>.from(hasil.map((x) => x.toJson())),
    };
}

class Hasil2 {
    Hasil2({
        required this.id,
        required this.username,
        required this.email,
        required this.password,
        required this.profileuser,
    });

    final String id;
    final String username;
    final String email;
    final String password;
    final String profileuser;

    factory Hasil2.fromJson(Map<String, dynamic> json) => Hasil2(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        profileuser: json["profileuser"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "profileuser": profileuser,
    };
}