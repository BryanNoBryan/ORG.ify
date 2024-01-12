class Event {
  int? eventId;
  String username;
  String title;
  String description;

  Event(
      {this.eventId,
      required this.username,
      required this.title,
      required this.description});

  Event.fromMap(Map<String, dynamic> res)
      : eventId = res["eventId"],
        username = res["username"],
        title = res["title"],
        description = res["description"];

  Map<String, Object?> toMap() {
    return {
      'eventId': eventId,
      'username': username,
      'title': title,
      'description': description
    };
  }
}
