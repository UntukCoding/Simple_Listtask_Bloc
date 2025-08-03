class MessageSuccessaddtask {
    MessageSuccessaddtask({
        required this.message,
    });

    final String message;

    factory MessageSuccessaddtask.fromJson(Map<String, dynamic> json) => MessageSuccessaddtask(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}