

class User {
  final int id;
  final String role;

  User(this.id, this.role);

  static User empty() {
    return User(0, '');
  }
}
