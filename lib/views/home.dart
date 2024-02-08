import 'package:flutter/material.dart';
import 'package:foodsapi/models/recipe.api.dart';
import 'package:foodsapi/models/recipe.dart';
import 'package:foodsapi/views/widgets/recipe_card.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> recipes;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecipe();
  }

  Future<void> getRecipe() async {
    recipes = await RecipeApi.getRecipe();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant_menu_outlined,
            ),
            SizedBox(
              width: 10,
            ),
            Text('Food Recipe')
          ],
        )),
        body: isLoading
            ? Center(
                child: CircularStepProgressIndicator(
                  totalSteps: 100,
                  currentStep: 74,
                  stepSize: 10,
                  selectedColor: Colors.greenAccent,
                  unselectedColor: Colors.grey[200],
                  padding: 0,
                  width: 150,
                  height: 150,
                  selectedStepSize: 15,
                  roundedCap: (_, __) => true,
                ),
              )
            : ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: recipes[index].name,
                      cookTime: recipes[index].totalTime,
                      rating: recipes[index].rating.toString(),
                      thumbnailUrl: recipes[index].image);
                },
              ));
  }
}
