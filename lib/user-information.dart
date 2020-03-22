class UserInformation {
  String firstName;
  String lastName;
  int gender; //1 for male, //2 for female
  int motivation; //1 for gainStrength, //2 for loseWeight
  int height; //stored in inches
  int weight; //stored in weight
  int experience; //1 for none, //2 for some, //3 for experienced

  UserInformation(
      {this.firstName,
      this.lastName,
      this.gender,
      this.motivation,
      this.height,
      this.weight,
      this.experience});

  String getFirstName() {
    if (firstName != null) {
      return firstName;
    } else {
      return 'first name error';
    }
  }

  String getLastName() {
    if (lastName != null) {
      return lastName;
    } else {
      return lastName;
    }
  }

  String getGender() {
    if (gender == 1) {
      return 'Male';
    } else if (gender == 2) {
      return 'Female';
    } else {
      return 'gender error';
    }
  }

  String getMotivation() {
    if (motivation == 1) {
      return 'wants to gain strength.';
    } else if (motivation == 2) {
      return 'want to lose weight.';
    } else {
      return 'motivation error';
    }
  }

  String getHeight() {
    return height.toString();
  }

  String getWeight() {
    return weight.toString();
  }

  String getExperience() {
    if (experience == 1) {
      return firstName + ' has no experince in working out.';
    } else if (experience == 2) {
      return firstName + ' has some experince in working out.';
    } else if (experience == 3) {
      return firstName + ' is experienced in working out.';
    } else {
      return 'experience error';
    }
  }
}
