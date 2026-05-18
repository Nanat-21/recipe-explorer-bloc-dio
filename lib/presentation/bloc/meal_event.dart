import 'package:equatable/equatable.dart';
import '../../domain/entities/meal.dart';

abstract class MealEvent extends Equatable {
  const MealEvent();

  @override
  List<Object?> get props => [];
}

class LoadMealsEvent extends MealEvent {}

class SearchMealsEvent extends MealEvent {
  final String query;
  const SearchMealsEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class FilterMealsEvent extends MealEvent {
  final String category;
  const FilterMealsEvent(this.category);

  @override
  List<Object?> get props => [category];
}

class ToggleFavoriteEvent extends MealEvent {
  final Meal meal;
  const ToggleFavoriteEvent(this.meal);

  @override
  List<Object?> get props => [meal];
}

class AddMealEvent extends MealEvent {
  final Meal meal;
  const AddMealEvent(this.meal);

  @override
  List<Object?> get props => [meal];
}

class DeleteMealEvent extends MealEvent {
  final int id;
  const DeleteMealEvent(this.id);

  @override
  List<Object?> get props => [id];
}

/* =========================
   ✅ NEW EVENTS (MEAL PLAN + SETTINGS)
========================= */

class AddMealPlanEvent extends MealEvent {
  final Map<String, dynamic> plan;

  const AddMealPlanEvent(this.plan);

  @override
  List<Object?> get props => [plan];
}

class DeleteMealPlanEvent extends MealEvent {
  final int index;

  const DeleteMealPlanEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class ToggleNotificationEvent extends MealEvent {}