int cooldown1, cooldown2;
boolean cooldownLock;

void mvmt()
{
  if (mouvement == "ML") 
  {
    transition = true; //Bloque les appuis sur les touches
    if (xref <= width-400) //Exécute ceci pendant la largeur de l'écran -400
    {
      xref+= accel; //Permet une transition fluide au lieu d'une transition brutale passant de 0 a 50 instantanément
      if (accel < 100)//Plafonne l'accélération à 100px/frame
      {
        accel += 10; //Augmente l'accélération de 10 à chaque frame
      }
    }
    else if ((xref > width-400) && (xref < width)) //Exécute ceci lors des 400 derniers pixels;   Les 400 s'expliquent par la descélération, lorsque on multiplie 100 par 0.75 jusqu'à ce que le 
    {                                                                                             //résulat soit inférieur à 1, puis on additionne le tout, on arrive a environ 400px
      xref += accel;
      accel *= 0.75; //A chaque frame, l'accélération se multiplie par 3/4 afin de ne pas faire un arrêt brutal
      if (accel<1) //Plafonne la déscélération 1px/frame, afin de ne pas se retrouver bloqué
      {
        accel=1;
      }
    }
    else
    {
      xref=width;          //
      mouvement = "Null";  //Remet toutes les variables en ordre, et met xref à width afin de corriger les petits décalages éventuels de l'ordre de 1px
      page="L";            //
      accel = 0;           //
      
    }
  }
  if (mouvement == "LM")
  {
    transition = true;
    if (xref >= 400)
    {
      xref-= accel;
      if (accel < 100)
      {
        accel += 10;
      }
    }
    else if ((xref < 400) && (xref > 0))
    {
      xref -= accel;
      accel *= 0.75;
      if (accel<1)
      {
        accel=1;
      }
    }
    else
    {
      xref=0;
      mouvement = "Null";
      page="M";
      accel = 0;
    }
  }
  if (mouvement == "MR")
  {
    transition = true;
    if (xref >= -width+400)
    {
      xref-= accel;
      if (accel < 100)
      {
        accel += 10;
      }
    }
    else if ((xref < -width+400) && (xref > -width))
    {
      xref -= accel;
      accel *= 0.75;
      if (accel<1)
      {
        accel=1;
      }
    }
    else
    {
      xref=-width;
      mouvement = "Null";
      page="R";
      accel = 0;
    }
  }
  if (mouvement == "RM")
  {
    transition = true;
    if (xref <= -400)
    {
      xref += accel;
      if (accel < 100)
      {
        accel += 10;
      }
    }
    else if ((xref > -400) && (xref < 0))
    {
      xref += accel;
      accel *= 0.75;
      if (accel<1)
      {
        accel=1;
      }
    }
    else
    {
      xref=0;
      mouvement = "Null";
      page="M";
      accel = 0;
    }
  }
  if (mouvement == "MU")
  {
    transition = true;
    if (yref <= height-400)
    {
      yref += accel;
      if (accel < 100)
      {
        accel += 10;
      }
    }
    else if ((yref > height-400) && (yref < height))
    {
      yref += accel;
      accel *= 0.75;
      if (accel<1)
      {
        accel=1;
      }
    }
    else
    {
      yref=height;
      mouvement = "Null";
      page="U";
      accel = 0;
    }
  }
  if (mouvement == "UM")
  {
    transition = true;
    if (yref >= 400)
    {
      yref -= accel;
      if (accel < 100)
      {
        accel += 10;
      }
    }
    else if ((yref < 400) && (yref > 0))
    {
      yref -= accel;
      accel *= 0.75;
      if (accel<1)
      {
        accel=1;
      }
    }
    else
    {
      yref=0;
      mouvement = "Null";
      page="M";
      accel = 0;
    }
  }
  if (mouvement == "MD")
  {
    transition = true;
    if (yref >= -height+400)
    {
      yref -= accel;
      if (accel < 100)
      {
        accel += 10;
      }
    }
    else if ((yref < -height+400) && (yref > -height))
    {
      yref -= accel;
      accel *= 0.75;
      if (accel<1)
      {
        accel=1;
      }
    }
    else
    {
      yref=-height;
      mouvement = "Null";
      page="D";
      accel = 0;
    }
  }
  if (mouvement == "DM")
  {
    transition = true;
    if (yref <= -400)
    {
      yref += accel;
      if (accel < 100)
      {
        accel += 10;
      }
    }
    else if ((yref > -400) && (yref < 0))
    {
      yref += accel;
      accel *= 0.75;
      if (accel<1)
      {
        accel=1;
      }
    }
    else
    {
      yref=0;
      mouvement = "Null";
      page="M";
      accel = 0;
    }
  }
  if (mouvement == "Setting1")
  {
    transition = true;
    if (xref >= -width+400)
    {
      xref-= accel;
      if (accel < 100)
      {
        accel += 10;
      }
    }
    else if ((xref < -width+400) && (xref > -width))
    {
      xref -= accel;
      accel *= 0.75;
      if (accel<1)
      {
        accel=1;
      }
    }
    else
    {
      xref=-width;
      mouvement = "Null";
      page="Setting1";
      accel = 0;
    }
  }
  if (mouvement == "Exit Setting1")
  {
    transition = true;
    if (xref <= -400)
    {
      xref += accel;
      if (accel < 100)
      {
        accel += 10;
      }
    }
    else if ((xref > -400) && (xref < 0))
    {
      xref += accel;
      accel *= 0.75;
      if (accel<1)
      {
        accel=1;
      }
    }
    else
    {
      xref=0;
      mouvement = "Null";
      page="U";
      accel = 0;
    }
  }
  if (mouvement == "Setting2")
  {
    transition = true;
    if (xref >= -2*width+400)
    {
      xref-= accel;
      if (accel < 100)
      {
        accel += 10;
      }
    }
    else if ((xref < -2*width+400) && (xref > -2*width))
    {
      xref -= accel;
      accel *= 0.75;
      if (accel<1)
      {
        accel=1;
      }
    }
    else
    {
      xref=-2*width;
      mouvement = "Null";
      page="Setting2";
      accel = 0;
    }
  }
  if (mouvement == "Exit Setting2")
  {
    transition = true;
    if (xref <= -width-400)
    {
      xref += accel;
      if (accel < 100)
      {
        accel += 10;
      }
    }
    else if ((xref > -width-400) && (xref < -width))
    {
      xref += accel;
      accel *= 0.75;
      if (accel<1)
      {
        accel=1;
      }
    }
    else
    {
      xref=-width;
      mouvement = "Null";
      page="Setting1";
      accel = 0;
    }
  }
  if (transition==true && mouvement=="Null")//Permet de ne pas changer de page pendant 30 frames après un mouvement, du a la sensibilité de la kinect, d'ou le "cooldown"
  {
    transition=true;
    cooldown1++;
    if (cooldown1 >= 30)
    {
      transition = false;
      cooldown1 = 0;
    }
  }
  if (cooldownLock == true || page=="U" && touche=="U" || page=="D" && touche=="D" || page=="L" && touche=="L" || page=="R" && touche=="R")
  {
    transition = true;
    cooldownLock = true;
    cooldown2++;
    if (cooldown2 >= 30)
    {
      transition = false;
      cooldownLock = false;
      cooldown2 = 0;
    }
  }
}
