import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_managemnet/core/theming/colors_manager.dart';
import 'package:food_managemnet/core/widgets/app_text_form_field.dart';
import 'package:food_managemnet/core/widgets/custom_button.dart';


class AddNewItemPropositionScreen extends StatefulWidget {
  const AddNewItemPropositionScreen({super.key});

  @override
  State<AddNewItemPropositionScreen> createState() => _AddNewItemPropositionScreenState();
}

class _AddNewItemPropositionScreenState extends State<AddNewItemPropositionScreen> {




  Widget _buildTextField(String title,String hint , TextEditingController controller , int? maxLines,TextInputType type){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,fontFamily: 'Roboto',color: ColorsManager.customTeal),),
        SizedBox(height: 5.h,),
        AppTextFormField(
            hintText: hint,
            textInputType: type,
            controller: controller,
            validator: (value){},
            maxLines: maxLines,
          ),
      ],
    );
  }




  Widget _buildTitleWidget(String text){
    return Row(
      children: [
        Text(text,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
          color: ColorsManager.customTeal
        ),)
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: ColorsManager.customTeal,)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 15.h),
            child: Column(
              children: [
                _buildTitleWidget('اقتراح لمنتج جديد'),
                SizedBox(height: 10.h,),
                _buildTextField('اسم المنتج', 'ادخل اسم المنتج..', TextEditingController(),1, TextInputType.text),
                SizedBox(height: 10.h,),
                _buildTextField('وصف المنتج', 'ادخل وصف عام عن هذا المنتج', TextEditingController(), 5, TextInputType.text),
                SizedBox(height: 100.h,),
                CustomButton(
                  buttonHeight: 60.h,
                    buttonText: 'إرسال', textStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto'
                ), onPressed: (){})

              ],
            ),
          ),
        ),
      ),
    );
  }
}







