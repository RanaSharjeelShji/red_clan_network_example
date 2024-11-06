import 'package:red_clan_network/red_clan_network.dart';

class RedService {
  
  static ApiService apiService = ApiService();
  static Future fetchData<T>({T Function(dynamic)? modelFromJson, url}) async {
    var response = await apiService.request<T>(
      url: url,
      method: 'GET',
      modelFromJson: modelFromJson,
      successStatusCodes: [200, 201],
    );
    print(response.response);
    if (response.isSuccess) {
      return response;
    } else {
      return response.code;
    }
  }

  static Future postData<T>({T Function(dynamic)? modelFromJson, body, url}) async {
    var response = await apiService.request<T>(
      url: url,
      method: 'POST',
      successStatusCodes: [200, 201],
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
      modelFromJson: modelFromJson,
    );
    if (response.isSuccess) {
      return response;
    } else {
      return response.code;
    }
  }

  static Future putData<T>({T Function(dynamic)? modelFromJson, body, url}) async {
    var response = await apiService.request<T>(
      url: url,
      method: 'PUT',
      successStatusCodes: [200, 201],
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
      modelFromJson: modelFromJson,
    );
    if (response.isSuccess) {
      return response;
    } else {
      return response.code;
    }
  }

  static Future deleteData<T>({T Function(dynamic)? modelFromJson, url}) async {
    var response = await apiService.request<T>(
      url: url,
      method: 'DELETE',
      successStatusCodes: [200, 201],
      headers: {'Content-Type': 'application/json', 'Authorization': ""},
      modelFromJson: modelFromJson,
    );
    if (response.isSuccess) {
      return response;
    } else {
      return response.code;
    }
  }
}
