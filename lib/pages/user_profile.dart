import 'package:e_market/services/profile_api_gateway.dart';
import 'package:e_market/utils/env_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:e_market/model/profile.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final EnvEndPoints envEndPoints = EnvEndPoints();
  final ProfileAPIGateway apiGateway = ProfileAPIGateway();
  Future<Profile> _userProfile;

  void _session() async
  {
    setState(()async {
      _userProfile = apiGateway.asyncGet("modesto.pouros@gmail.com");
    });
  }

  void initState()
  {
    super.initState();
    _session();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _userProfile,
          builder: (BuildContext context, AsyncSnapshot<Profile> snapshot)
          {
            if (snapshot.connectionState == ConnectionState.waiting)
              {
                return Container(
                  padding: EdgeInsets.all(400),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            else if(snapshot.hasError)
              {
                final error = snapshot.error;
                return Text(error.toString());
              }
            else if(snapshot.hasData)
              {
                Profile profile = snapshot.data;
                return container(context, profile);
              }
            else
              {
                return Text("No Profile Found");
              }
          }),
       )
    );
  }

  Widget container(BuildContext context, Profile profile)
  {
    return Column(
      children: [
        Text(profile.firstname.toString()),
        Text(profile.lastname.toString())
      ],
    );
  }
}
