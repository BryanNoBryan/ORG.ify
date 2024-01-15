import 'dart:developer';

class FakeData {
  //int is perms
  static Map<List<String>, int> people = {
    ['Admin', '123', 'school']: 1,
    ['User', '321', 'school']: 0,
  };

  static int? events;

  static int? login(String name, String pw, String org) {
    final perm = people.entries
        .where((e) => e.key[0] == name && e.key[1] == pw && e.key[2] == org);

    if (perm.isEmpty) {
      return null;
    } else {
      return perm.firstOrNull!.value;
    }
  }

  // static List<List<String>> announcements = [
  //   ['Winter Break', '6 days off!'],
  //   ['Fall Break', '1 days off!'],
  //   ['Summer Break', '54 days off!'],
  //   ['Spring Break', '5 days off!'],
  //   ['Snow Day', '15 days off!'],
  // ];
}
