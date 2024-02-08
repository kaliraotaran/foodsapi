class Recipe {
  final String name;
  final String totalTime;
  final String image;
  final double rating;
  Recipe({
    required this.name,
    required this.totalTime,
    required this.image,
    required this.rating,
  });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'] as String,
        totalTime: json['totalTime'] as String,
        image: json['images'][0]['hostedLargeUrl'],
        rating: json['rating'] as double);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $image,  rating: $rating, totalTime: $totalTime}';
  }
}
