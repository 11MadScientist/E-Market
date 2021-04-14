import 'package:e_market/trappings/trap.dart';
import 'package:validators/validators.dart';
class SigninTrap extends Trap
{

   NameTrap(String name)
  {
    if(!isAlpha(name))
      {
        message = "Invalid Input! Only Letters are allowed";
      }
  }
}