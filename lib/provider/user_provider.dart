import 'package:flutter/material.dart';
//登录状态管理
class UserProvider extends ChangeNotifier{
  bool _isSigned=false;
  get isSigned=>_isSigned;
  setisSigned (bool state){
    _isSigned=state;
    notifyListeners();  
  }
}