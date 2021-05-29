class EnvEndPoints
{
  String env = "dev";

  getEndPoints(path)
  {
    final apiEndPoints = {
      "dev": "https://emerkado.000webhostapp.com" + path,
    };
    return apiEndPoints[env];
  }
}