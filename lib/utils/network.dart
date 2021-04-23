import 'dart:convert';
import 'package:http/http.dart' as http;

class Network
{
  Network(this.url);

  String url;

  Future getData() async
  {
    http.Response response = await http.get(url);
    if (response.statusCode == 200)
      {
        return jsonDecode(response.body);
      }
    else
      {
        return response.toString();
      }
  }
  Future getListData() async
  {
    http.Response response = await http.get(url);
    if (response.statusCode == 200)
    {
      return response.body;
    }
    else
    {
      return response.toString();
    }
  }

  Future postData(Map data) async
  {
    http.Response response = await http.post(url, body: data);

    if (response.statusCode == 201)
      {
        return jsonDecode(response.body);
      }
    else
      {
        return null;
      }
  }
}