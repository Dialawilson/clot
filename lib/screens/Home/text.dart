import 'dart:ffi';

void main(){
  String password = "2123+3";

  List<String> verifyPassword = ["#", "!", "@" "%", "^", "&", "*"];

  // bool isValid = password.length >= 8 && verifyPassword.any((char) => password.contains(char));
 
  if (verifyPassword.any((char) => password.contains(char)) && password.contains(char) >2) {
    print("Password is valid.");
  } else {
    print("Password is invalid. It must be at least 8 characters long and contain at least one special character.");
  }
}