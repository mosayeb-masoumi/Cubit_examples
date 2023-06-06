abstract class StreamRepository {
  Future<dynamic> getData();
}

class IStreamRepository extends StreamRepository{

  @override
  Future<dynamic> getData() async {
    await Future.delayed(const Duration(seconds: 2));
    String token =  "kjkkdfgkjsdj";
    String data = token;
    return data;
  }

}