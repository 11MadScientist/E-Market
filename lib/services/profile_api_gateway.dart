import 'package:e_market/model/profile.dart';
import 'package:e_market/utils/env_endpoints.dart';
import 'package:e_market/utils/network.dart';

class ProfileAPIGateway
{
  final EnvEndPoints envEndPoints = EnvEndPoints();

  Profile profile;

  Future<Profile> asyncGet(String email) async
  {
    try
    {
      Network network = Network(envEndPoints.getEndPoints('/api/userinfo/$email'));
      dynamic body = await network.getData();
      profile = Profile.fromJson(body);
      print(body);
    }
    catch (e)
    {
      return null;
    }
    return profile;
  }

  Future<Profile> asyncPost(Map data) async
  {
    try
    {
      Network network = Network(envEndPoints.getEndPoints('/api/userinfo'));
      dynamic body = await network.postData(data);
      profile = Profile.fromJson(body);
    }
    catch(e)
    {
      print(e);
    }
    return profile;
  }
  }

