import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class GiveController extends GetxController {
  // 初始化生物认证
  final LocalAuthentication localAuth = LocalAuthentication();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkAuth() async {
    // 首先判断是否支持生物识别
    try {
      final bool canAuthenticateWithBiometrics =
          await localAuth.canCheckBiometrics;
      print(canAuthenticateWithBiometrics);
      final bool canAuthenticate =
          canAuthenticateWithBiometrics || await localAuth.isDeviceSupported();
      // final bool canAuthenticate = await localAuth.isDeviceSupported();
      print(canAuthenticate);
    } catch (e) {
      print(e);
    }
  }

  void getAuthList() async {
    // 首先判断是否支持生物识别
    try {
      final List<BiometricType> availableBiometrics =
          await localAuth.getAvailableBiometrics();

      if (availableBiometrics.isNotEmpty) {
        // Some biometrics are enrolled.
        print(availableBiometrics);
      }
    } catch (e) {
      print(e);
    }
  }

  void didAuth() async {
    try {
      bool didAuthenticate = await localAuth.authenticate(
        localizedReason: '扫描指纹进行身份识别',
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            cancelButton: '取消',
            goToSettingsButton: '去设置',
            biometricNotRecognized: '指纹识别失败',
            goToSettingsDescription: '请设置指纹.',
            biometricHint: '指纹',
            biometricSuccess: '指纹识别成功',
            signInTitle: '指纹验证',
            deviceCredentialsRequiredTitle: '请先录入指纹!',
          ),
          IOSAuthMessages(
            //更多 ios 的参数请参考源码
            cancelButton: '取消',
            goToSettingsButton: '去设置',
            goToSettingsDescription: '请设置指纹.',
          ),
        ],
        options: const AuthenticationOptions(
            useErrorDialogs: false, stickyAuth: true),
      );
      print(didAuthenticate);
    } catch (e) {
      print(e);
    }
  }
}
