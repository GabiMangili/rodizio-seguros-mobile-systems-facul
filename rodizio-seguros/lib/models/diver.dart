class Driver{
  final String name;
  final String dateOfBirth;

  Driver(this.name, this.dateOfBirth);

  Driver.fromMap(Map map)
    : name = map["name"],
      dateOfBirth = map["driverDOB"];

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "driverDOB": dateOfBirth
    };
  }
}

