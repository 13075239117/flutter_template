import 'dart:convert';

import 'package:template_1/services/request.dart';

class LoginService {
  /// 获取用户数据中心列表
  static Future<List> getDataCenter() async {
    var response = await DioRequest.getInstance().dio.get('/getDataCenter');
    var data = jsonDecode(response.toString());
    return data['dataCenterList'];
  }

  /// 登录接口
  static login(value) async {
    var response = await DioRequest.getInstance()
        .dio
        .post('/sys/login', queryParameters: value);
    var data = jsonDecode(response.toString());

    /// 对返回的身份凭证全局持久化存储
    return data['key'];
  }

  /// 获取权限列表
  static menuNav() async {
    var response = await DioRequest.getInstance().dio.get('/sys/menu/nav');
    var data = jsonDecode(response.toString());
    return data['key'];
  }
}

@override
void initState() {
  // TODO: implement initState
  super.initState();

  /// 请求用户数据中心数据
  LoginService.getDataCenter().then((value) {
    setState(() {
      _dataCenterList = value;
    });
  });
}
