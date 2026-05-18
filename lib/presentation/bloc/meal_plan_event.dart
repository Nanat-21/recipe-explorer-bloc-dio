import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart'; // ✅ FIX: required for IconData

abstract class MealPlanEvent extends Equatable {
  const MealPlanEvent();

  @override
  List<Object?> get props => [];
}

class LoadMealPlans extends MealPlanEvent {}

class AddMealPlanEvent extends MealPlanEvent {
  final String day;
  final String meal;
  final String time;
  final IconData icon;

  const AddMealPlanEvent({
    required this.day,
    required this.meal,
    required this.time,
    required this.icon,
  });

  @override
  List<Object?> get props => [day, meal, time, icon];
}

class DeleteMealPlanEvent extends MealPlanEvent {
  final int index;

  const DeleteMealPlanEvent(this.index);

  @override
  List<Object?> get props => [index];
}