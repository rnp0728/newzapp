import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/searchbar.dart';
import '../utils/key.dart';

Future<List> fetchNews(String categoryName) async{
  final url = Uri.parse('https://newsapi.org/v2/top-headlines?country=in&category=$categoryName&pageSize=100&apiKey=${Key.apiKey}&q=${SearchBar.searchController.text}');
  final response = await http.get(url);

  Map result = jsonDecode(response.body);
  print('Fetched');
  return result['articles'];
}