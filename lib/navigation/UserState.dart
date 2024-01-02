class UserState {
  static int perm = -1;

  static String organizationID = '';
  static String name = '';
  static String pw = '';

  static void signOut() {
    perm = -1;
    organizationID = '';
    name = '';
    pw = '';
  }

  static final Map<int, String> perms = {
    1: 'Admin',
    0: 'User',
  };
}
