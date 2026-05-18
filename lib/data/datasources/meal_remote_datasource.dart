import 'package:dio/dio.dart';

class MealRemoteDataSource {
  final Dio dio;

  MealRemoteDataSource(this.dio);

  Future<List> getMeals(String query) async {
    final response = await dio.get("search.php?s=$query");
    return response.data["meals"] ?? [];
  }

  Future<List> getRandomMeal() async {
    final response = await dio.get("random.php");
    return response.data["meals"] ?? [];
  }
}