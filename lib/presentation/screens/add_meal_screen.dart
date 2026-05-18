import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/meal.dart';

import '../bloc/meal_bloc.dart';
import '../bloc/meal_event.dart';

class AddMealScreen
    extends StatefulWidget {
  const AddMealScreen({
    super.key,
  });

  @override
  State<AddMealScreen> createState() =>
      _AddMealScreenState();
}

class _AddMealScreenState
    extends State<AddMealScreen> {
  final titleController =
      TextEditingController();

  final descriptionController =
      TextEditingController();

  final imageController =
      TextEditingController();

  final stepsController =
      TextEditingController();

  String selectedCategory =
      'Breakfast';

  final categories = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Dessert',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Add Meal'),
      ),

      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller:
                  titleController,
              decoration:
                  const InputDecoration(
                labelText:
                    'Meal Title',
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
                  descriptionController,
              maxLines: 3,
              decoration:
                  const InputDecoration(
                labelText:
                    'Description',
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
                  imageController,
              decoration:
                  const InputDecoration(
                labelText:
                    'Image URL',
              ),
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField<
                String>(
              value:
                  selectedCategory,
              items:
                  categories.map((
                category,
              ) {
                return DropdownMenuItem(
                  value: category,
                  child:
                      Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory =
                      value!;
                });
              },
              decoration:
                  const InputDecoration(
                labelText:
                    'Category',
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
                  stepsController,
              maxLines: 5,
              decoration:
                  const InputDecoration(
                labelText:
                    'Steps (separate with commas)',
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final meal = Meal(
                    id: DateTime.now()
                        .millisecondsSinceEpoch,

                    title:
                        titleController.text,

                    description:
                        descriptionController
                            .text,

                    imageUrl:
                        imageController.text,

                    category:
                        selectedCategory,

                    steps:
                        stepsController
                            .text
                            .split(','),
                  );

                  context
                      .read<MealBloc>()
                      .add(
                        AddMealEvent(
                          meal,
                        ),
                      );

                  Navigator.pop(
                    context,
                  );
                },
                child:
                    const Text(
                  'Add Meal',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}