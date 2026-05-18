import '../datasources/meal_remote_datasource.dart';

class MealRepositoryImpl {
  final MealRemoteDataSource remote;

  MealRepositoryImpl(this.remote);

  Future<List> fetchMeals(String query) async {
    return await remote.getMeals(query);
  }
}