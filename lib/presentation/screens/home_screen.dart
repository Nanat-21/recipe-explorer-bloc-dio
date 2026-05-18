import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/meal_bloc.dart';
import '../bloc/meal_event.dart';
import '../bloc/meal_state.dart';

import '../widgets/category_chip.dart';
import '../widgets/featured_banner.dart';
import '../widgets/meal_card.dart';
import '../widgets/search_bar_widget.dart';

import 'add_meal_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    'All',
    'Breakfast',
    'Lunch',
    'Dinner',
    'Dessert',
  ];

  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<MealBloc>().add(LoadMealsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealBloc, MealState>(
      builder: (context, state) {
        
        if (state is! MealLoaded) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final meals = state.meals;

        return Scaffold(
          backgroundColor: const Color(0xFFFFF8F2),

          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orange,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddMealScreen(),
                ),
              );
            },
          ),

          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // HEADER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello 👋',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Find Your Recipe',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: Color(0xFFFFE0B2),
                        child: Icon(
                          Icons.restaurant,
                          color: Colors.orange,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 28),

                  // SEARCH
                  SearchBarWidget(
                    onChanged: (value) {
                      context
                          .read<MealBloc>()
                          .add(SearchMealsEvent(value));
                    },
                  ),

                  const SizedBox(height: 28),

                  const FeaturedBanner(),

                  const SizedBox(height: 35),

                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 18),

                  SizedBox(
                    height: 52,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (ctx, i) {
                        final category = categories[i];

                        return CategoryChip(
                          title: category,
                          isSelected: selectedCategory == category,
                          onTap: () {
                            setState(() {
                              selectedCategory = category;
                            });

                            context.read<MealBloc>().add(
                                  FilterMealsEvent(category),
                                );
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 35),

                  const Text(
                    'Popular Recipes',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  meals.isEmpty
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(40),
                            child: Text('No recipes found'),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics:
                              const NeverScrollableScrollPhysics(),
                          itemCount: meals.length,
                          itemBuilder: (ctx, i) {
                            return MealCard(
                              meal: meals[i],
                            );
                          },
                        ),

                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}