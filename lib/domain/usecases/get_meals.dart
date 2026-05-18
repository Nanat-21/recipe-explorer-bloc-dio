import '../repositories/meal_repository.dart';

class GetMeals {
  final MealRepository repository;

  GetMeals(this.repository);

  Future<List> call(String query) {
    return repository.getMeals(query);
  }
}