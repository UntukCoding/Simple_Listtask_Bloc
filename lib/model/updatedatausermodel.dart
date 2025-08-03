class MessageSuccessupdatedatauser {
    MessageSuccessupdatedatauser({
        required this.message,
    });

    final String message;

    factory MessageSuccessupdatedatauser.fromJson(Map<String, dynamic> json) => MessageSuccessupdatedatauser(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}