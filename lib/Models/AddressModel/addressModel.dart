class AddressModel {
  String placeFormattedAddress;
  String placeName;
  String placeId;
  double latitude;
  double longitude;
  AddressModel({
    this.placeFormattedAddress,
    this.placeName,
    this.placeId,
    this.latitude,
    this.longitude,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    this.placeFormattedAddress = json['placeFormattedAddress'];
    this.placeName = json['placeName'];
    this.placeId = json['placeId'];
    this.latitude = json['latitude'];
    this.longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['placeFormattedAddress'] = this.placeFormattedAddress;
    data['placeName'] = this.placeName;
    data['placeId'] = this.placeId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
