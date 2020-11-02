import 'package:flutter/material.dart';
//登录状态管理
class UserProvider extends ChangeNotifier{

  
  bool _isSigned=false;
  ///用户是否登陆
  get isSigned=>_isSigned;

  ///设置用户登陆
  setisSigned (bool state){
    _isSigned=state;
    notifyListeners();  
  }


  
}