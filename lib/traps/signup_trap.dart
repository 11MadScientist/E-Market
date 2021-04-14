import 'package:e_market/traps/trap.dart';
import 'package:validators/validators.dart';
class SignupTrap extends Trap
{
  NameTrap(String name)
  {
    if(name == "")
    {
      message = ("Field required to be filled up!");
    }
    else if(!isAlpha(name))
      {
        message = ("Name consists of letters only!");
      }
    else
      {
        return;
      }
    return error();
  }
}