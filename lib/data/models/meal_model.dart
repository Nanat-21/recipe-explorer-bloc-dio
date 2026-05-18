import '../../domain/entities/meal.dart';

class MealModel extends Meal {
  const MealModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.category,
    required super.steps,
  });

  factory MealModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return MealModel(
      id: int.tryParse(
            json['idMeal']?.toString() ??
                json['id']?.toString() ??
                '0',
          ) ??
          0,

      title:
          json['strMeal'] ??
          json['title'] ??
          'Unknown Meal',

      description:
          json['strInstructions'] ??
          json['description'] ??
          'No description',

      imageUrl:
          json['strMealThumb'] ??
          json['imageUrl'] ??
          'https://images.unsplash.com/photo-1544025162-d76694265947',

      category:
          json['strCategory'] ??
          json['category'] ??
          'General',

      steps:
          json['steps'] != null
              ? List<String>.from(json['steps'])
              : [
                  'Prepare ingredients',
                  'Cook the food',
                  'Serve and enjoy',
                ],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'category': category,
      'steps': steps,
    };
  }
}