class CreditCard{
  final int number;
  final String type;
  final String expiry;
  final int cvc;

  const CreditCard({required this.type, required this.number,required this.expiry,required this.cvc});

  factory CreditCard.fromJson(Map<String, dynamic> json){
    return CreditCard(
      number :json['number'],
      type : json['type'],
      expiry : json['expiry'],
      cvc : json['cvc'],
    );
  }
}