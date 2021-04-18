import 'package:e_market/traps/trap.dart';
import 'package:flutter/cupertino.dart';
import 'package:validators/validators.dart';
import 'package:e_market/services/api_gateway.dart';
import 'package:e_market/utils/env_endpoints.dart';
import 'package:e_market/model/profile.dart';

class ProfileTrap extends Trap
{
  final EnvEndPoints envEndPoints = EnvEndPoints();
  final APIGateway apiGateway = APIGateway();
  Profile profile;



  NameTrap(String name)
  {
    if(name == "")
    {
      message = ("Field required to be filled up!");
    }
    else if(!isAlpha(name) )
      {
        message = ("Name consists of letters only!");
      }
    else
      {
        return null;
      }
    return error();
  }

  PassTrap(String pass)
  {
    RegExp bigLetter   = new RegExp(r'(?=.*[A-Z])');
    RegExp smallLetter = new RegExp(r'(?=.*[a-z])');
    RegExp digit       = new RegExp(r'(?=.*\d)');
    RegExp symbol      = new RegExp(r'(?=.*[-+_!@#$%^&*.,?])');
    //[-+_!@#$%^&*.,?] can be used to replace \W if it is too broad

    if(pass.length < 8)
      {
        message = ("Password too short!");
      }
    else if(!bigLetter.hasMatch(pass))
      {
        message = ("Requires at least 1 Uppercase letter");
      }
    else if(!smallLetter.hasMatch(pass))
      {
        message = ("Requires at least 1 Lowercase letter");
      }
    else if(!digit.hasMatch(pass))
      {
        message = ("Requires at least 1 digit");
      }
    else if(!symbol.hasMatch(pass))
      {
        message = ("Requires at least 1 special symbol");
      }
    else
      {
        return null;
      }
    return error();
  }
  Future<String> emailDuplication(email)async
  {
    profile = await apiGateway.asyncGet(email);
    if(profile != null)
    {
      return profile.email;
    }
    else
      return null;
  }


  emailCheck(email)async
  {
    await emailDuplication(email).then((result) {
      if(result != null)
        {
          message = ("Email '$result' is already taken");
        }
      else
        {
          message = null;
        }
    });
    if(message == null)
      {
        return null;
      }
    return error();

  }

  emailTrap(email)
  {
    RegExp emailCheck = new RegExp(r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]"
    r"|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|"
    r"[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)"
    r"|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]"
    r"|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|"
    r"(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))"
    r"*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|"
    r"[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])"
    r"([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|"
    r"[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|"
    r"[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])"
    r"([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
    if(!emailCheck.hasMatch(email))
      {
        message = ("Invalid Email");
        return error();
      }
    else
      {
        return null;
      }
  }

  phoneNumberTrap(String phone)
  {
    if(!isNumeric(phone) || phone.length < 11 || phone.length > 11)
      {
        message = ("Invalid Phone Format");
      }
    else
    {
      return null;
    }
    return error();
  }

  defaultTrap(String def)
  {
     if(def == "")
       {
         message = ("Required to populate Field");
       }
     else
       {return null;}
     return error();
  }
}