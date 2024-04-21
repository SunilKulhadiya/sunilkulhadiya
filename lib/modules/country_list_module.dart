import 'dart:ffi';

class CountryListModule {
  final int Id;
  final String Country;
  final String Code;
  final String Tel_Code;
  final String Flage;

  CountryListModule({
    required this.Id,
    required this.Country,
    required this.Code,
    required this.Tel_Code,
    required this.Flage,
  });

  factory CountryListModule.fromJson(Map<String, dynamic> json) {
    return CountryListModule(
      Id: json['id'],
      Country: json['name'],
      Code: json['code'],
      Tel_Code: json['tel_code'],
      Flage: json['flag']
    );
  }
}