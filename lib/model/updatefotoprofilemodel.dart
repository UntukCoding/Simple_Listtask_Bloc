class MessageSuccessupdatefotoprofile {
    MessageSuccessupdatefotoprofile({
        required this.message,
    });

    final String message;

    factory MessageSuccessupdatefotoprofile.fromJson(Map<String, dynamic> json) => MessageSuccessupdatefotoprofile(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}