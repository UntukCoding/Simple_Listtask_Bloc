class Login {
    Login({
        required this.username,
        required this.email,
    });

    final String username;
    final String email;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        username: json["username"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
    };
}