import 'package:flutter/services.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

enum LoginException {
  canceled;
}

abstract class LoginService {
  static const naver = NaverLoginService();
  static const kakao = KakaoLoginService();

  final FlutterSecureStorage _storage;

  const LoginService() : _storage = const FlutterSecureStorage();

  Future<String?> login();
  Future<void> logout() async {
    _storage.delete(key: 'w_token');
  }

  Future<void> remove() async {
    _storage.delete(key: 'w_token');
  }
}

class NaverLoginService extends LoginService {
  const NaverLoginService();

  @override
  Future<String?> login() async {
    try {
      if (await FlutterNaverLogin.isLoggedIn) {
        final res = await FlutterNaverLogin.currentAccessToken;
        return res.accessToken;
      }

      final NaverLoginResult res = await FlutterNaverLogin.logIn();

      if (res.status != NaverLoginStatus.loggedIn) {
        return null;
      }

      final token = await FlutterNaverLogin.currentAccessToken;
      return token.accessToken;
    } catch (e) {
      await FlutterNaverLogin.logOutAndDeleteToken();
      return null;
    }
  }

  @override
  Future<void> logout() async {
    await FlutterNaverLogin.logOut();
    super.logout();
  }

  @override
  Future<void> remove() async {
    await FlutterNaverLogin.logOutAndDeleteToken();
    super.remove();
  }
}

class KakaoLoginService extends LoginService {
  const KakaoLoginService();

  @override
  Future<String?> login() async {
    try {
      OAuthToken token = await isKakaoTalkInstalled()
          ? await _loginWithKakaoTalk()
          : await _loginWithKakaoAccount();
      return token.accessToken;
    } on LoginException {
      print('Kakao Login Canceled');
      return null;
    } catch (e) {
      print('Error :: Kakao.login failed $e');
      return null;
    }
  }

  Future<OAuthToken> _loginWithKakaoTalk() async {
    try {
      return await UserApi.instance.loginWithKakaoTalk();
    } on PlatformException catch (e) {
      if (e.code == 'CANCELED') {
        throw LoginException.canceled;
      }
      return _loginWithKakaoAccount();
    } catch (e) {
      rethrow;
    }
  }

  Future<OAuthToken> _loginWithKakaoAccount() async {
    try {
      return await UserApi.instance.loginWithKakaoTalk();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await UserApi.instance.logout();
    super.logout();
  }

  @override
  Future<void> remove() async {
    await UserApi.instance.logout();
    super.remove();
  }
}
