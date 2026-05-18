import 'package:flutter_bloc/flutter_bloc.dart';

import 'meal_plan_event.dart';
import 'meal_plan_state.dart';

class MealPlanBloc extends Bloc<MealPlanEvent, MealPlanState> {
  MealPlanBloc() : super(const MealPlanState()) {
    on<LoadMealPlans>(_onLoad);
    on<AddMealPlanEvent>(_onAdd);
    on<DeleteMealPlanEvent>(_onDelete);
  }

  void _onLoad(
    LoadMealPlans event,
    Emitter<MealPlanState> emit,
  ) {
    emit(const MealPlanState(mealPlans: []));
  }

  void _onAdd(
    AddMealPlanEvent event,
    Emitter<MealPlanState> emit,
  ) {
    final updated = List<Map<String, dynamic>>.from(state.mealPlans);

    updated.add({
      'day': event.day,
      'meal': event.meal,
      'time': event.time,
      'icon': event.icon,
    });

    emit(state.copyWith(mealPlans: updated));
  }

  void _onDelete(
    DeleteMealPlanEvent event,
    Emitter<MealPlanState> emit,
  ) {
    final updated = List<Map<String, dynamic>>.from(state.mealPlans);

    updated.removeAt(event.index);

    emit(state.copyWith(mealPlans: updated));
  }
}