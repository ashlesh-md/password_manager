class User {
  final String _fullName;
  final String _email;
  final String _password;
  User(this._fullName, this._email, this._password);
}

class AllUsers {
  List<User> users = [];
  void adduser(
      {required String fullname,
      required String email,
      required String password}) {
    users.add(User(fullname, email, password));
  }

  bool getUser(String username, String password) {
    for (var element in users) {
      if (element._fullName == username && element._password == password) {
        return true;
      }
    }
    return false;
  }
}
