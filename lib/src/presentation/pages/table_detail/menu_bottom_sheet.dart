import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// utils
import '/config/dimensions/padding.dart';
import '/config/dimensions/width.dart';

/// models
import '/src/data/models/meal_model.dart';

/// components
import '/src/presentation/pages/table_detail/widgets.dart';

import '/src/presentation/controllers/.controllers.dart';

Future openMenu(
  TableDetailPageControllerImpl controller,
) {
  controller.getMeals();
  return Get.bottomSheet(
    Builder(builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 6,
        child: GetBuilder(
          init: controller,
          id: controller.mealListId,
          builder: (getContext) {
            return ListView(
              children: controller.meals
                  .map(
                    (el) => MealItem(meal: el, controller: controller),
                  )
                  .toList(),
            );
          },
        ),
      );
    }),
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15),
      ),
    ),
    isScrollControlled: false,
    isDismissible: true,
  );
}

class MealItem extends StatelessWidget {
  final MealModel meal;
  final TableDetailPageController controller;

  const MealItem({
    super.key,
    required this.meal,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: paddingTop16,
        padding: paddingAll20,
        decoration: BoxDecoration(color: Colors.green[50]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.wine_bar,
                  color: Color.fromARGB(255, 68, 255, 84),
                ),
                horizontalSpace20,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(meal.title ?? 'Meal'),
                    Text('price: ${meal.price?.toString() ?? ''} ')
                  ],
                ),
              ],
            ),
            IncreaseButton(
              add: () {
                controller.addMeal(meal);
                Get.back();
              },
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
