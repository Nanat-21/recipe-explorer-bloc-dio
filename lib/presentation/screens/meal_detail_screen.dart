import 'package:flutter/material.dart';

import '../../domain/entities/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailScreen({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:
          Colors.grey.shade100,

      appBar: AppBar(
        title: Text(meal.title),
        backgroundColor:
            Colors.deepOrange,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            /// IMAGE
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,

              errorBuilder:
                  (context, error, stackTrace) {

                return Container(
                  height: 300,
                  color:
                      Colors.grey.shade300,

                  child: const Center(
                    child: Icon(
                      Icons.image,
                      size: 70,
                    ),
                  ),
                );
              },
            ),

            Padding(
              padding:
                  const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  Text(
                    meal.title,
                    style:
                        const TextStyle(
                      fontSize: 30,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),

                    decoration: BoxDecoration(
                      color: Colors
                          .deepOrange
                          .shade100,

                      borderRadius:
                          BorderRadius.circular(
                        20,
                      ),
                    ),

                    child: Text(
                      meal.category,
                      style: TextStyle(
                        color: Colors
                            .deepOrange
                            .shade700,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    meal.description,
                    style:
                        const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'Cooking Steps',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  ...List.generate(
                    meal.steps.length,
                    (index) {

                      return Container(
                        margin:
                            const EdgeInsets.only(
                          bottom: 15,
                        ),

                        padding:
                            const EdgeInsets.all(
                          16,
                        ),

                        decoration:
                            BoxDecoration(
                          color: Colors.white,

                          borderRadius:
                              BorderRadius.circular(
                            18,
                          ),

                          boxShadow: [
                            BoxShadow(
                              color: Colors
                                  .black
                                  .withOpacity(
                                    0.05,
                                  ),
                              blurRadius: 8,
                            ),
                          ],
                        ),

                        child: Row(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: [

                            CircleAvatar(
                              backgroundColor:
                                  Colors
                                      .deepOrange,

                              child: Text(
                                '${index + 1}',
                                style:
                                    const TextStyle(
                                  color: Colors
                                      .white,
                                ),
                              ),
                            ),

                            const SizedBox(
                              width: 15,
                            ),

                            Expanded(
                              child: Text(
                                meal.steps[
                                    index],
                                style:
                                    const TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

