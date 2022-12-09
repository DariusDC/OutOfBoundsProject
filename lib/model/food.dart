import 'ingredient.dart';

class Food {
  final String name;
  final String description;
  final List<Ingredient> ingredients;

  Food({
    required this.description,
    required this.ingredients,
    required this.name,
  });
}
