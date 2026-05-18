import 'package:equatable/equatable.dart';

class Meal extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  final List<String> steps;

  const Meal({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.steps,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        imageUrl,
        category,
        steps,
      ];
}