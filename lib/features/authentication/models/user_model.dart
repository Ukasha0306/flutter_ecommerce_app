import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.profilePicture});


  String get fullName => '$firstName $lastName';

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUserName(fullName){
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUserName = '$firstName$lastName';
    String userNameWithPrefix = "uka_$camelCaseUserName";

    return userNameWithPrefix;
  }

  // static function to create an empty user model.

  static UserModel empty()=>UserModel(id: '', firstName: '', lastName: '', userName: '', email: '', phoneNumber: '', profilePicture: '');
  // convert model to JSON Structure for storing data in firebase
  Map<String, dynamic> toJson(){
    return {
      'FirstName' : firstName,
      'LastName' : lastName,
      'UserName' : userName,
      'Email' : email,
      'PhoneNumber' : phoneNumber,
      'ProfilePicture' : profilePicture,
    };
  }

  // factory method to create a UserModel from a firebase document snapshot.

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    if(document.data() != null){
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstName: data['FirstName'] ?? '',
          lastName: data['LastName'] ?? '',
          userName: data['UserName'] ?? '',
          email: data['Email'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          profilePicture: data['ProfilePicture'] ?? '');
    }
    else{
     return  UserModel.empty();
    }
  }
}
