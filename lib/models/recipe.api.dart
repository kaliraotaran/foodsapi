import 'dart:convert';

import 'package:foodsapi/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
// const req = unirest('GET', 'https://yummly2.p.rapidapi.com/feeds/list');

// req.query({
// 	limit: '24',
// 	start: '0'
// });

// req.headers({
// 	'X-RapidAPI-Key': '6e6309e3a1mshf8002240f89f67cp16a0bbjsn2b8ae57b0150',
// 	'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
// });

  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {'limit': '18', 'start': '0', 'tag': 'list.recipe.popular'});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '6e6309e3a1mshf8002240f89f67cp16a0bbjsn2b8ae57b0150',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      "useQueryString": "true"
    });
    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(temp);
  }
}
