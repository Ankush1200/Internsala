// For using json.decode
import 'package:http/http.dart' as http;
import 'package:internsala_assignment/model/model.dart';

class Internshala{
  

static Future<void> fetchData() async {
  String apiUrl = "https://internshala.com/flutter_hiring/search"; // Replace with your API URL

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // If the server returns a successful response, decode the JSON data.
      final data = welcomeFromJson(response.body);
      // Process the data here
      print(data.internshipsMeta);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // Handle any errors that occur during the request.
    print('Error: $e');
  }
}

}