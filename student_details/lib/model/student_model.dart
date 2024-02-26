class StudentModel {
  String? name;
  String? phone;
  String? address;
  String? division;
  String? image;

  StudentModel(
      {this.name, this.phone, this.address, this.division, required this.image});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
        image: json["image"],
        name: json["name"] as String,
        phone: json["phone"],
        address: json["address"],
        division: json["division"]);
  }
  Map<String,dynamic> tojson(){
    return{
      "image" : image,
      "name" : name,
      "phone" : phone,
      "address" : address,
      division
    }
  }
}
