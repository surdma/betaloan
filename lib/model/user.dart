class User {
  String firstName;
  String dateOfBirth;
  int age;
  var profilePicture;
  var phoneNumber;

  User({
    required this.firstName,
    required this.dateOfBirth,
    required this.age,
    this.profilePicture,
    this.phoneNumber,
  });
}
