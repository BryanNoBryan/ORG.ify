class UserState {
  static int _perm = -1;

  static int get perm => _perm;

  static set perm(int perm) => _perm = perm;

  static void signOut() {
    _perm = -1;
  }

  static final Map<int, String> perms = {
    1: 'Admin',
    0: 'User',
  };
}
