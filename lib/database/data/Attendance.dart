class Attendance {
  int? id;
  String username;
  DateTime time;

  Attendance({this.id, required this.username, required this.time});

  Attendance.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        username = res["username"],
        time = DateTime.parse(res["time"]);

  Map<String, Object?> toMap() {
    return {'id': id, 'username': username, 'time': time.toString()};
  }
}
