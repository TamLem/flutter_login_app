
class User {
  int _id;
  String _email;
  String _password;
  String _birthDate;

  User( this._id, this._email, this._password, this._birthDate);

  int get id => _id;

  String get email => _email;

  String get password => _password;

  String get birthDate => _birthDate;



  set email ( String newemail) {
    this._email = newemail;
  }

  set password ( String newPassword) {
    this._password = newPassword;
  }

  set birthDate ( String newDate) {
    this._birthDate = newDate;
  }

  // Convert a User Object to Map, becauase sqlite database works with Map
  Map <String, dynamic> toMap () {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['email'] = _email;
    map['password'] = _password;
    map['birthDate'] = _birthDate;

    return map;

  }

  //Convert a Map object from database to normal object

  User.fromMapObject(Map<String, dynamic> map) {
      this._id = map['id'];
      this._email = map['email'];
      this._password = map['password'];
      this._birthDate = map['birthDate'];
  } 

}