import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}
// food class with a name and image
class Food {
  final String name;
  final String image;

  Food(this.name, this.image);
}
//make a stateless widget so it cant be changed
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FoodPicker(),
      debugShowCheckedModeBanner: false,
    );
  }
}
//make a stateful widget so we can change, add, and remove from it
class FoodPicker extends StatefulWidget {
  const FoodPicker({super.key});

  @override
  State<FoodPicker> createState() => _FoodPickerState();
}
// add a list of foods and their images and history list
class _FoodPickerState extends State<FoodPicker> {
  Food? selectedFood;
  List<Food> history = [];

  final Map<String, List<Food>> foods = {
    "Sweet": [
      Food("Ice Cream 🍨", "https://i.imgur.com/9p2JsUt_d.webp"),
      Food("Cake 🍰", "https://i.imgur.com/NzXcwEP_d.webp"),
      Food("Pancakes 🥞", "https://i.imgur.com/zUolVtm_d.webp"),
    ],
    "Savoury": [
      Food("Burger 🍔", "https://i.imgur.com/NcaT7F2_d.webp"),
      Food("Shawarma 🌯",
          "https://b3067249.smushcdn.com/3067249/wp-content/uploads/2022/07/Shawarma-848x477.jpg"),
      Food("Pizza 🍕", "https://i.imgur.com/rVE2J7Z_d.webp"),
    ],
    "Healthy": [
      Food("Salad 🥗", "https://i.imgur.com/ZgRLQCV_d.webp"),
      Food("Chicken 🍗", "https://i.imgur.com/pfIflf3_d.webp"),
      Food("Smoothie 🍹", "https://i.imgur.com/WbNkBvh_d.webp"),
    ],
    "Vegan": [
      Food("Tofu Bowl 🌱",
          "https://media.post.rvohealth.io/wp-content/uploads/2021/08/tofu-salad-pineapple-quinoa-vegan-meal-1296x728-header-800x728.png"),
      Food("Lentil Soup 🍲", "https://i.imgur.com/Sop6z6w_d.webp"),
      Food("Vegan Burger 🍔",
          "https://i.ytimg.com/vi/n61yCEtXKV4/maxresdefault.jpg"),
    ],
  };
 //pick a random food from the list depending on the category
  void pickFood(String category) {
    final list = foods[category];

    if (list == null || list.isEmpty) return;

    final random = Random();
    final newFood = list[random.nextInt(list.length)];

    HapticFeedback.mediumImpact();

    setState(() {
      selectedFood = newFood;
      history.insert(0, newFood);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text("Food Picker 🍽️"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                /// DISPLAYS FOOD
                selectedFood != null
                    ? Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              selectedFood!.image,
                              height: 220,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.fastfood, size: 100);
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            selectedFood!.name,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    : const Text(
                        "Pick a category",
                        style: TextStyle(fontSize: 22),
                      ),

                const SizedBox(height: 30),

                /// 🎯 BUTTONS
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: foods.keys.map((category) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () => pickFood(category),
                      child: Text(category),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 40),

                /// 📜 HISTORY
                const Text(
                  "History 📜",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: history.length,
                    itemBuilder: (context, index) {
                      final food = history[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                food.image,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              food.name,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}