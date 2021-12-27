import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/modules/search/search_cubit/cubit.dart';
import 'package:lost_app/modules/search/search_cubit/states.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController homeAppBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: white,
            appBar: AppBar(
              backgroundColor: white,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_sharp, color: black),
              ),
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              title: Container(
                decoration: BoxDecoration(
                  color: white,
                  //borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(height: 45),
                    child: TextFormFieldClass(
                      autofocus: true,
                      controller: homeAppBarController,
                      roundedRectangleBorder: 10,
                      textHint: 'البحث...',
                    ),
                  ),
                ),
              ),
            ),
            //body:
          );
        });
  }
}
