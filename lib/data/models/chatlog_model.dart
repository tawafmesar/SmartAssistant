class chatlogmodel {
  String? chatlogId;
  String? chatlogPrompt;
  String? chatlogResponse;
  String? chatlogModel;
  String? chatlogUser;
  String? chatlogDate;

  chatlogmodel({
    this.chatlogId,
    this.chatlogPrompt,
    this.chatlogResponse,
    this.chatlogModel,
    this.chatlogUser,
    this.chatlogDate,
  });

  factory chatlogmodel.fromJson(Map<String, dynamic> json) {
    return chatlogmodel(
      chatlogId: json['chatlog_id'],
      chatlogPrompt: json['chatlog_prompt'],
      chatlogResponse: json['chatlog_response'],
      chatlogModel: json['chatlog_model'],
      chatlogUser: json['chatlog_user'],
      chatlogDate: json['chatlog_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chatlog_id': chatlogId,
      'chatlog_prompt': chatlogPrompt,
      'chatlog_response': chatlogResponse,
      'chatlog_model': chatlogModel,
      'chatlog_user': chatlogUser,
      'chatlog_date': chatlogDate,
    };
  }

  @override
  String toString() {
    return 'chatlogmodel{'
        'chatlogId: $chatlogId, '
        'chatlogPrompt: $chatlogPrompt, '
        'chatlogResponse: $chatlogResponse, '
        'chatlogModel: $chatlogModel, '
        'chatlogUser: $chatlogUser, '
        'chatlogDate: $chatlogDate}';
  }
}
