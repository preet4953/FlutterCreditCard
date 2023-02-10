
class Person{
  final int id;
  final String name;
  final String email;

  const Person({required this.id, required this.name,required this.email});

  factory Person.fromJson(Map<String, dynamic> json){
    return Person(
      id :json['id'],
      name : json['name'],
      email : json['email'],
    );
  }
}