import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';



class SearchTextField extends StatelessWidget {

  final TextEditingController searchController;
  final String hint;

  SearchTextField({
   required this.searchController,
   required this.hint
});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 50.h,
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            color: ColorsManager.customDarkGrey,
          ),
          filled: true,
          fillColor: Color(0xFFFAFAFA),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16.0)
          ),
          prefixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search,color: ColorsManager.customDarkGrey,))
        ),
      ),
    );
  }
}
