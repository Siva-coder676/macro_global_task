import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:macro_global_task/core/models/product_details.dart';
import 'package:macro_global_task/theme/colors.dart';
import 'package:macro_global_task/widgets/task_button.dart';
import 'package:macro_global_task/widgets/task_text.dart';

class ProductListWidget extends StatelessWidget {
  final Products? products;
  final Function(int)? onChangedvalue;
  const ProductListWidget({this.products, this.onChangedvalue});

  @override
  Widget build(BuildContext context) {
    return Container(
     // height: MediaQuery.of(context).size.height * 0.13,
      child: Card(
        shadowColor: textColor,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          onTap: () {
            onChangedvalue!(products!.id!);
          },
          leading: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(products!.thumbnail!),
          ),
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: "Name : ",
                    style: const TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                TextSpan(text: products!.title, style: TextStyle(fontSize: 13)),
              ],
            ),
          ),
          subtitle: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: "Product Price : ",
                    style: const TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text: products!.price!.toString(),
                    style: TextStyle(fontSize: 13)),
              ],
            ),
          ),
          trailing: TaskButton(
            width: MediaQuery.of(context).size.width * 0.20,
            height: MediaQuery.of(context).size.height * 0.05,
            buttonText: "More Info",
            voidCallback: () {
              Logger().i("is Tapped");
              onChangedvalue!(products!.id!);
            },
          ),
        ),
      ),
    );
  }
}
