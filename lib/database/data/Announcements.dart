class Announcement {
  int? id;
  String title;
  String description;

  Announcement({this.id, required this.title, required this.description});

  Announcement.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"],
        description = res["description"];

  Map<String, Object?> toMap() {
    return {'id': id, 'title': title, 'description': description};
  }
}
