class CardInfoVO {
  String name = '';
  String designation = '';
  String secondaryEmail = '';
  String number = '';
  String secondaryNumber = '';
  String primaryEmail = '';
  String website = '';
  String scanText = '';
  String imageString = '';
  String companyName = '';

  // Constructor
  CardInfoVO({
    this.name = '',
    this.designation = '',
    this.primaryEmail = '',
    this.secondaryEmail = '',
    this.number = '',
    this.website = '',
    this.scanText = '',
    this.secondaryNumber = '',
    this.companyName = '',
    this.imageString = '',
  });

  // Factory constructor for creating a User object from JSON data
  factory CardInfoVO.fromJson(Map<String, dynamic> json) {
    return CardInfoVO(
      name: json['name'],
      designation: json['designation'],
      companyName: json['companyName'],
      secondaryEmail: json['secondaryEmail'],
      primaryEmail: json['primaryEmail'],
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
      'companyName': companyName,
      'secondaryEmail': secondaryEmail,
      'primaryEmail': primaryEmail,
      'number': number,
      'secondaryNumber': secondaryNumber,
      'website': website,
      'scanText': scanText,
      'imageString': imageString,
    };
  }
}
