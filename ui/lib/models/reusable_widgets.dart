import 'package:flutter/material.dart';

Image logoWidget(String imageName){
  return Image.asset(
   imageName,
  fit: BoxFit.fitWidth,
  width: 240,
  height: 240,
  );
  
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType, TextEditingController controller){
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
         color: Colors.white,
         ),
         labelText: text,
         labelStyle: const TextStyle(color: Colors.white),
         filled: true,
         floatingLabelBehavior: FloatingLabelBehavior.never,
         fillColor: Colors.grey[800],
         border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(width: 0,style: BorderStyle.none),
         )
    ),
    keyboardType: isPasswordType
    ? TextInputType.visiblePassword
    : TextInputType.emailAddress,
  );


}

Container signInSingUpButton(
  BuildContext context, bool islogin, Function() onPressed){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child:ElevatedButton(
        onPressed: () {
          onPressed();
          },
            style: ButtonStyle(
              backgroundColor:WidgetStateProperty.resolveWith((states){
                if(states.contains(WidgetState.pressed)){
                  return Colors.black26;
                }
                return Colors.white;
              } ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
            ),
          ),
          child:Text(
            islogin ? "Log In" : "Sign Up",
            style: const TextStyle(
              color:Color.fromARGB(221, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 16),
            )
      )
    );

}