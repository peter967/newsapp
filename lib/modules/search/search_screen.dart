import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit/News_cubit.dart';
import '../../shared/widgets/article_builder.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        var list = NewsCubit.get(context).search;
        return Scaffold(
          backgroundColor: cubit.isDark ? Colors.black : Colors.white,
          appBar: AppBar(
            title: TextFormField(
              autofocus: true,
              style: TextStyle(
                color: cubit.isDark ? Colors.white : Colors.black,
              ),
              controller: searchController,
              onChanged: (value) {
                cubit.getSearch(value);
              },
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: cubit.isDark ? Colors.white : Colors.black,
                ),
              
              ),
            ),
          ),
          body: Column(
            children: [Expanded(child: articleBuilder(list, context))],
          ),
        );
      },
    );
  }
}
