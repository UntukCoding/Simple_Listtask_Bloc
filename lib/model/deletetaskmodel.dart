
class MessageSuccesdeletetask {
    MessageSuccesdeletetask({
        required this.message,
    });

    final String message;

    factory MessageSuccesdeletetask.fromJson(Map<String, dynamic> json) => MessageSuccesdeletetask(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
