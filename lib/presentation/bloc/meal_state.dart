import 'package:equatable/equatable.dart';
import '../../domain/entities/meal.dart';

abstract class MealState extends Equatable {
  const MealState();

  @override
  List<Object?> get props => [];
}

class MealInitial extends MealState {}

class MealLoading extends MealState {}

class MealLoaded extends MealState {
  final List<Meal> meals;
  final List<Meal> favorites;
  final List<Map<String, dynamic>> mealPlans;
  final bool notifications;

  const MealLoaded({
    required this.meals,
    required this.favorites,
    required this.mealPlans,
    required this.notifications,
  });

  @override
  List<Object?> get props => [
        meals,
        favorites,
        mealPlans,
        notifications,
      ];

  MealLoaded copyWith({
    List<Meal>? meals,
    List<Meal>? favorites,
    List<Map<String, dynamic>>? mealPlans,
    bool? notifications,
  }) {
    return MealLoaded(
      meals: meals ?? this.meals,
      favorites: favorites ?? this.favorites,
      mealPlans: mealPlans ?? this.mealPlans,
      notifications: notifications ?? this.notifications,
    );
  }
}

class MealError extends MealState {
  final String message;

  const MealError(this.message);

  @override
  List<Object?> get props => [message];
}