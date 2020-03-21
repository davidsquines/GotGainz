import 'package:fitness_app/databases/user-info-helper.dart';

class UserInfo {
  String lastName;
  String firstName;

  int gender; //1 for male, //2 for female
  int motivation; //1 for gainStrength, //2 for loseWeight
  int height; //stored in inches
  int weight; //stored in weight
  int experience; //1 for none, //2 for some, //3 for experienced

  UserInfo(
      {this.lastName,
      this.firstName,
      this.gender,
      this.motivation,
      this.height,
      this.weight,
      this.experience});

  UserInfo.fromMap(Map<String, dynamic> map) {
    lastName = map['lastName'];
    firstName = map['firstName'];
    gender = map['gender'];
    motivation = map['motivation'];
    height = map['height'];
    weight = map['weight'];
    experience = map['experience'];
  }

  Map<String, dynamic> toMap() {
    return {
      UserInfoDatabaseHelper.columnLastName: lastName,
    };
  }
}
