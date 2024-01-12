class SignUp {
  int? id;
  int eventId;
  String username;

  SignUp({this.id, required this.eventId, required this.username});

  SignUp.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        eventId = res["eventId"],
        username = res["username"];

  Map<String, Object?> toMap() {
    return {'id': id, 'eventId': eventId, 'username': username};
  }
}
