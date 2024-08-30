import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internsala_assignment/model/model.dart';


final internships=FutureProvider((ref){
  const url="https://internshala.com/flutter_hiring/search";
  return http.get(Uri.parse(url)).then((value) =>welcomeFromJson(value.body));
});