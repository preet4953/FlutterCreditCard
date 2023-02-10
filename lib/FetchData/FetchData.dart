import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Person.dart';
import 'CreditCard.dart';
//const String url= 'https://jsonplaceholder.typicode.com/users';
const String url= 'https://api.placeholderjson.dev/credit-card';
Future<List<CreditCard>> fetch() async {
 List<CreditCard> li=<CreditCard>[];
 final response = await http.get(Uri.parse(url));
 var data=json.decode(response.body);
 if(response.statusCode==200){
  for(var p in data){
   li.add(CreditCard.fromJson(p));
  }
  return li;
 }
 else{
  throw Exception('failed to load');
 }
}



// Future<List<Person>> fetch() async {
//  List<Person> li=<Person>[];
//  final response = await http.get(Uri.parse(url));
//  var data=json.decode(response.body);
//  if(response.statusCode==200){
//   for(var p in data){
//    li.add(Person.fromJson(p));
//   }
//    return li;
//  }
//  else{
//   throw Exception('failed to load');
//  }
// }