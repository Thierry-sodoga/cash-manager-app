class CreditCarte {
  CreditCarte({
    required this.id,
    required this.name,
    required this.number,
    required this.date,
    required this.cvv,
    required this.balance,
    required this.checkoutCardsCollection,
  });
  late final int id;
  late final String name;
  late final String number;
  late final String date;
  late final int cvv;
  late final int balance;
  late final List<dynamic> checkoutCardsCollection;
  
  CreditCarte.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    number = json['number'];
    date = json['date'];
    cvv = json['cvv'];
    balance = json['balance'];
    checkoutCardsCollection = List.castFrom<dynamic, dynamic>(json['checkoutCardsCollection']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['number'] = number;
    data['date'] = date;
    data['cvv'] = cvv;
    data['balance'] = balance;
    data['checkoutCardsCollection'] = checkoutCardsCollection;
    return data;
  }
}