class User{
  late final String firstName;
  late final String lastName;
  late final String phoneNumber;
  late final String address;
  late final String email;
  late final String password;

  User({required this.firstName,required this.lastName, required this.phoneNumber, required this.address,required this.email, required this.password});

  Map<String, dynamic> toMap()
  {
    return {
      'firstName' : firstName,
      'lastName' : lastName,
      'phoneNumber' : phoneNumber,
      'address' : address,
      'email' : email,
      'password' : password
    };
  }
  User.fromMap(dynamic map){
    firstName = map['firstName'];
    lastName = map['lastName'];
    phoneNumber = map['phoneNumber'];
    address = map['address'];
    email = map['email'];
    password = map['password'];
  }

  User toEntity() => User(
    firstName: firstName,
    lastName: lastName,
    phoneNumber: phoneNumber,
    address: address,
    email: email,
    password: password,
  );
}