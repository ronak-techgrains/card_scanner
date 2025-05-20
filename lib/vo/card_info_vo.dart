class CardInfoVo {
  String name = '';
  String designation = '';
  String email = '';
  String number = '';
  String secondaryNumber = '';
  String website = '';
  String scanText = '';
  String imageString = '';

  // Constructor
  CardInfoVo({
    this.name = '',
    this.designation = '',
    this.email = '',
    this.number = '',
    this.website = '',
    this.scanText = '',
    this.secondaryNumber = '',
    this.imageString = '',
  });

  // Factory constructor for creating a User object from JSON data
  factory CardInfoVo.fromJson(Map<String, dynamic> json) {
    return CardInfoVo(
      name: json['name'],
      designation: json['designation'],
      email: json['email'],
      number: json['number'],
      secondaryNumber: json['secondaryNumber'],
      website: json['website'],
      scanText: json['scanText'],
      imageString: json['imageString'],
    );
  }

  // Method to convert User object to JSON format
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'designation': designation,
      'email': email,
      'number': number,
      'secondaryNumber': secondaryNumber,
      'website': website,
      'imageString': imageString,
    };
  }
}
