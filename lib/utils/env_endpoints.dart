class EnvEndPoints
{
  String env = "dev";

  getEndPoints(path)
  {
    final apiEndPoints = {
      "dev": "http://emarket.hustle" + path,
    };
    return apiEndPoints[env];
  }
}