class MessageSuccessedittask {
    MessageSuccessedittask({
        required this.message,
    });

    final String message;

    factory MessageSuccessedittask.fromJson(Map<String, dynamic> json) => MessageSuccessedittask(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}