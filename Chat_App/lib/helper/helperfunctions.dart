import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{

  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferenceUserNameKey = "USERNAMEKEY";
  static String sharedPreferenceUserEmailKey = "USERMAILKEY";

 //saving data to shared preference
static Future<bool> saveUserLoggedInSharedPreferences(bool isUserLoggedIn)async{
  SharedPreferences prefs =await SharedPreferences.getInstance();
  return await prefs.setBool(sharedPreferenceUserLoggedInKey, isUserLoggedIn);

}

  static Future<bool> saveUserNameSharedPreferences(String userName)async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserNameKey, userName);

  }

  static Future<bool> saveUserEmailSharedPreferences(String userEmail)async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserEmailKey, userEmail);

  }

//getting data from shared preferences

  static Future<bool> getUserLoggedInSharedPreferences() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    return  await prefs.getBool(sharedPreferenceUserLoggedInKey);

  }

  static Future<String> getUserNameSharedPreferences()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    return  prefs.getString(sharedPreferenceUserNameKey);

  }
  static Future<String> getUserEmailSharedPreferences()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    return  prefs.getString(sharedPreferenceUserEmailKey);

  }

}
