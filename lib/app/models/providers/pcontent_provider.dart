import 'package:get/get.dart';

import '../pcontent_model.dart';

class PcontentProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return PContentModel.fromJson(map);
      if (map is List)
        return map.map((item) => PContentModel.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<PContentModel?> getPcontent(int id) async {
    final response = await get('pcontent/$id');
    return response.body;
  }

  Future<Response<PContentModel>> postPcontent(PContentModel pcontent) async =>
      await post('pcontent', pcontent);
  Future<Response> deletePcontent(int id) async => await delete('pcontent/$id');
}
