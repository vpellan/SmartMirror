void page()
{
  if (transition == false)//Empèche le code de s'exécuter lorsque une transition est en cours
  {
    if (touche == "L" && page == "M")
    {
      mouvement = "ML";
    }
    else if (touche == "R" && page == "L")
    {
      mouvement = "LM";
    }
    else if (touche == "R" && page == "M")
    {
      mouvement = "MR";
    }
    else if (touche == "L" && page == "R")
    {
      mouvement = "RM";
    }
    else if (touche == "U" && page == "M")
    {
      mouvement = "MU";
    }
    else if (touche == "D" && page == "U")
    {
      mouvement = "UM";
    }
    else if (touche == "D" && page == "M")
    {
      mouvement = "MD";
    }
    else if (touche == "U" && page == "D")
    {
      mouvement = "DM";
    }
    else if (touche == "R" && page == "U")
    {
      mouvement = "Setting1";
    }
    else if (touche == "L" && page == "Setting1")
    {
      mouvement = "Exit Setting1";
    }
    else if (touche == "R" && page == "Setting1")
    {
      mouvement = "Setting2";
    }
    else if (touche == "L" && page == "Setting2")
    {
      mouvement = "Exit Setting2";
    }
  }
}
