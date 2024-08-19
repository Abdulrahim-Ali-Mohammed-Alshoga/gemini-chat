class MessageModel {
  String? _text;
  bool? _isUser;

  MessageModel({String? text, bool? isUser}) {
    _text = text;
    _isUser = isUser;
  }

  String? get text => _text;

  bool? get isUser => _isUser;

  factory MessageModel.fromMap(Map<String, dynamic> json) => MessageModel(
        text: json["userId"],
        isUser: json["userName"],
      );

  Map<String, dynamic> toMap() => {
        "t_idno": _text,
        "t_nama": _isUser,
      };
}
