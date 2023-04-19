import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:macro_global_task/core/models/product_details.dart';
import 'package:macro_global_task/theme/colors.dart';
import 'package:macro_global_task/views/category_screen/widgets/product_list_widget.dart';
import 'package:macro_global_task/views/login/login_view_model.dart';
import 'package:macro_global_task/widgets/task_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'category_screen_view_model.dart';

class CategoryScreenView extends StatelessWidget {
  CategoryScreenView();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryScreenViewModel>.reactive(
      builder:
          (BuildContext context, CategoryScreenViewModel viewModel, Widget? _) {
        return Scaffold(
            backgroundColor: buttonTextColor,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: TaskAppBar(
                  text: "Products Screen",
                )),
            body: Column(
              children: [
                viewModel.isProductLoadingState
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: CircularProgressIndicator(
                            color: splashScreenBackgroundColor,
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: viewModel.products.length,
                            itemBuilder: (context, index) {
                              Products? products = viewModel.products[index];
                              return ProductListWidget(
                                products: products,
                                onChangedvalue: (int? value) {
                                  viewModel.navigateToDetailScreen(value);
                                },
                              );
                            }),
                      ),
              ],
            ));
      },
      viewModelBuilder: () => CategoryScreenViewModel(),
    );
  }
}
