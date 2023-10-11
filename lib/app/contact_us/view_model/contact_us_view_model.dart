import 'package:eltafouk_ecademy/app/auth/view_model/auth_view_model.dart';
import 'package:eltafouk_ecademy/base_view_model.dart';
import 'package:eltafouk_ecademy/locator.dart';
import 'package:eltafouk_ecademy/services/api_service.dart';
import 'package:eltafouk_ecademy/services/shared_pref_services.dart';
import 'package:eltafouk_ecademy/utils/strings.dart';

class ContactUsViewModel extends BaseViewModel {
  AuthenticationViewModel authenticationViewModel = AuthenticationViewModel();
  ApiService apiService = locator<ApiService>();
  var pref = locator<SharedPrefServices>();
  String token = '';

  getToken() async {
    token = await pref.getString(userToken);
    print('token : $token');
  }
}
