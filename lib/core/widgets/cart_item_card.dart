import 'package:flutter/material.dart';
import 'package:food_managemnet/models/grocery_item_model.dart';


class CartItemCard extends StatelessWidget {

  final GroceryItem groceryItem;

  CartItemCard(this.groceryItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin:const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                groceryItem.imagePath.toString(),
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    groceryItem.itemName.toString(),
                    style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'السعر: \$${groceryItem.itemPrice}',
                    style: TextStyle(fontSize: 16, color: Colors.green[700]),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
