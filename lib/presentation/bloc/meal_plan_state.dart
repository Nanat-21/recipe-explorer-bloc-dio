import 'package:equatable/equatable.dart';

class MealPlanState extends Equatable {
  final List<Map<String, dynamic>> mealPlans;

  const MealPlanState({
    this.mealPlans = const [],
  });

  MealPlanState copyWith({
    List<Map<String, dynamic>>? mealPlans,
  }) {
    return MealPlanState(
      mealPlans: mealPlans ?? this.mealPlans,
    );
  }

  @override
  List<Object?> get props => [mealPlans];
}