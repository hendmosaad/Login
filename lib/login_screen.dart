import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var formKey1=GlobalKey<FormState>();
  var formKey2=GlobalKey<FormState>();
  var formKey3=GlobalKey<FormState>();
   double sizedBoxHeight=15.0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     backgroundColor: Colors.grey[100],
      body: bodyColumn(),
    );
  }
  Widget bodyColumn ()=>

      Center(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 20,end: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Login",style:loginStyle(50,Colors.black) ,),
                SizedBox(height:sizedBoxHeight ,),
                loginField(formKey:formKey1,function: (){},labelText: "email",prefixIcon: Icons.email,keyboardType: TextInputType.emailAddress ,width: double.infinity,hieght: 50 ),
                SizedBox(height:sizedBoxHeight ,),
                loginField(formKey:formKey2,function: (){},labelText: "password", prefixIcon: Icons.lock,suffixIcon: Icons.remove_red_eye_outlined,keyboardType: TextInputType.visiblePassword,width:double.infinity ,hieght: 50 ),
                SizedBox(height:sizedBoxHeight ,),
                SizedBox(height:sizedBoxHeight ,),
                loginButton(formKey: formKey3, Text: Text("Login",style: loginStyle(20,Colors.black),), function: (){}),
                SizedBox(height:sizedBoxHeight ,),
                Align(
                  alignment: Alignment.center,
                    child: forgetPassButton())



              ],
            ),
          ),
        ),
      );
  TextStyle loginStyle(double size,Color color)=>
      TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color
      );
  Widget loginField(
      {required var formKey,
        required dynamic function,
        required String labelText,
        required TextInputType keyboardType,
        IconData? prefixIcon,
        IconData? suffixIcon,
       required double hieght,
       required double? width
      }) =>
      Container(
        height:hieght,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              boxShadowItem(),
              boxShadowItem(),
              boxShadowItem(),
              boxShadowItem()
            ]),
             child:   TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'this field an\'t be null';
            }
          },
          decoration: InputDecoration(
              hintText: labelText,
              hintStyle: TextStyle(
                  fontSize: 15
              ),
              border: InputBorder.none,
              prefixIcon: Icon(
                prefixIcon,
                size: 18,
                color: Colors.black54,
              ),
              suffixIcon: Icon(
                suffixIcon,
                color: Colors.black54,
                size: 18,
              )),
      ),
            );
  BoxShadow boxShadowItem()=> BoxShadow(
      inset: false,
      offset: Offset(3, 10),
      color: Colors.black12,
      blurRadius: 20);
  Widget loginButton(
      {required var formKey,
        required Widget Text,
        required dynamic function}) =>
      MaterialButton(onPressed:
        () => {},
        child: Container(
          height: 50,
          width: double.infinity,
          child: Text,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    inset: false,
                    offset: Offset(3, 10),
                    color: Colors.black12,
                    blurRadius: 20),
                BoxShadow(
                    inset: false,
                    offset: Offset(-5, -10),
                    color: Colors.white,
                    spreadRadius: 5,
                    blurRadius: 20),
                BoxShadow(
                    inset: true,
                    offset: Offset(-5, -5),
                    color: Colors.white,
                    blurRadius: 15),
                BoxShadow(
                    inset: true,
                    offset: Offset(5, 10),
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 1)
              ]),
        ),
      );
  Widget forgetPassButton()=>
      TextButton(child:Text("Forgotten password?",style: loginStyle(15,Colors.blue)),onPressed: (){},);
}

