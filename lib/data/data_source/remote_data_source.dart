import 'package:advanced_flutter/data/network/app_api.dart';
import 'package:advanced_flutter/data/network/requests.dart';
import 'package:advanced_flutter/data/response/responses.dart';

abstract class RemoteDataSource {
Future<AuthenticationResponse>login(LoginRequest loginRequest);
 Future<ForgotPasswordResponse>forgotPassword(String email);
 Future<AuthenticationResponse>register(RegisterRequest registerRequest);
 Future<HomeResponse>getHomeData() ;
Future<StoreDetailsResponse> getStoreDetails();
}





class RemoteDataSourceImpl implements RemoteDataSource {
AppServiceClient _appServiceClient;
RemoteDataSourceImpl(this._appServiceClient);

@override
  Future<AuthenticationResponse>login(LoginRequest loginRequest)async{

return await _appServiceClient.login(loginRequest.email, loginRequest.password);
  }


@override
  Future<ForgotPasswordResponse>forgotPassword(String email)async{

  return await _appServiceClient.forgotPassword(email);
  }

@override
  Future<AuthenticationResponse>register(RegisterRequest registerRequest)async{

return await _appServiceClient.register(
        registerRequest.countryMobileCode,
        registerRequest.userName,
        registerRequest.email,
        registerRequest.password,
        registerRequest.mobileNumber,
        "");
  }
  
  @override
  Future<HomeResponse> getHomeData()async {
 return await _appServiceClient.getHomeData();
    
  }
 
 


  @override
  Future<StoreDetailsResponse> getStoreDetails()async {
 return await _appServiceClient.getStoreDetails();
  }}

