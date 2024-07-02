class UserModel {
  String? deliveryName;

  UserModel({this.deliveryName});

  UserModel.fromJson(Map<String, dynamic> json) {
    deliveryName = json['DeliveryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DeliveryName'] = deliveryName;
    return data;
  }
}
