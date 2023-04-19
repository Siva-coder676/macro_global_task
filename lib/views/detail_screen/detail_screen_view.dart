import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:macro_global_task/theme/colors.dart';
import 'package:macro_global_task/widgets/task_app_bar.dart';
import 'package:macro_global_task/widgets/task_text.dart';
import 'package:stacked/stacked.dart';
import 'detail_screen_view_model.dart';

class DetailScreenView extends StatelessWidget {
  final int? id;
  DetailScreenView({this.id});
  @override
  Widget build(BuildContext context) {
    Logger().v(id);
    var width = MediaQuery.of(context).size.width * 0.12;
    return ViewModelBuilder<DetailScreenViewModel>.reactive(
      builder:
          (BuildContext context, DetailScreenViewModel viewModel, Widget? _) {
        return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: TaskAppBar(
                  text: "Detail Screen",
                )),
            body: viewModel.isLoadingState!
                ? Center(
                    child: CircularProgressIndicator(
                      color: splashScreenBackgroundColor,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: viewModel.result?.thumbnail != null
                              ? CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(
                                      viewModel.result!.thumbnail!),
                                )
                              : SizedBox()),
                      SizedBox(
                        height: 15,
                      ),
                      productDescription(
                          title: "title :".toUpperCase(),
                          value: viewModel.result?.title != null
                              ? viewModel.result?.title
                              : "-",
                          context: context),
                      SizedBox(
                        height: 15,
                      ),
                      productDescription(
                          title: "description :".toUpperCase(),
                          value: viewModel.result?.description != null
                              ? viewModel.result?.description
                              : "-",
                          context: context),
                      SizedBox(
                        height: 15,
                      ),
                      productDescription(
                          title: "price :".toUpperCase(),
                          value: viewModel.result?.price != null
                              ? viewModel.result?.price.toString()
                              : "-",
                          context: context),
                      SizedBox(
                        height: 15,
                      ),
                      productDescription(
                          title: "discountPercentage :".toUpperCase(),
                          value: viewModel.result?.discountPercentage != null
                              ? viewModel.result?.discountPercentage.toString()
                              : "-",
                          context: context),
                      SizedBox(
                        height: 15,
                      ),
                      productDescription(
                          title: "rating :".toUpperCase(),
                          value: viewModel.result?.rating != null
                              ? viewModel.result?.rating.toString()
                              : "-",
                          context: context),
                      SizedBox(
                        height: 15,
                      ),
                      productDescription(
                          title: "stock :".toUpperCase(),
                          value: viewModel.result?.stock != null
                              ? viewModel.result?.stock.toString()
                              : "-",
                          context: context),
                      SizedBox(
                        height: 15,
                      ),
                      productDescription(
                          title: "brand :".toUpperCase(),
                          value: viewModel.result?.brand != null
                              ? viewModel.result?.brand.toString()
                              : "-",
                          context: context),
                      SizedBox(
                        height: 15,
                      ),
                      productDescription(
                          title: "category :".toUpperCase(),
                          value: viewModel.result?.category != null
                              ? viewModel.result?.category.toString()
                              : "-",
                          context: context),
                    ],
                  ));
      },
      viewModelBuilder: () => DetailScreenViewModel(id),
    );
  }

  productDescription({String? title, String? value, BuildContext? context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TaskText(
            text: title,
          ),
          SizedBox(
            width: MediaQuery.of(context!).size.width * 0.14,
          ),
          Expanded(
            child: Text(
              value!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
