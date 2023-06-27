boolean u1,u2,d1,d2,l1,l2,r1,r2,eeb,eea,konami,k_switch;

void easter()
{
  if (touche == "U" && u1 == false && u2 == false && d1 == false && d2 == false && l1 == false && r1 == false && r2 == false && l2 == false && eeb == false) //enclenchement de la detection de séquence lors d'un mouvement vers le haut
  {
    u1 = true;
    u2 = false;
    d1 = false;
    d2 = false;
    l1 = false;
    l2 = false;
    r1 = false;
    r2 = false;
    eeb = false;
    eea = false;
    konami = false;
    eetime++;
    touche = "Null";
    println("U1");
  }
  
  if (u1 == true && u2 == false && d1 == false && d2 == false && l1 == false && r1 == false && r2 == false && l2 == false && eeb == false)
  {
    eetime++;
    if (touche == "U" && eetime <=120) // detection de l'input suivant
    {
        u2 = true;
        u1 = false;
        touche = "Null";
        eetime = 0;
        println("U2");
    }
    else if (eetime > 120) //remise à zero si un autre input est fait
    {
      eetime = 0;
      u1 = false;
    }
  }
  
  if (u2 == true && u1 == false && d1 == false && d2 == false && l1 == false && r1 == false && r2 == false && l2 == false && eeb == false)
  {
    eetime++;
    if (touche == "D" && eetime <=120)
    {
        d1 = true;
        u2 = false;
        touche = "Null";
        eetime = 0;
        println("D1");
    }
    else if (eetime > 120)
    {
      eetime = 0;
      u2 = false;
    }
  }
  
  if (d1 == true && u1 == false && u2 == false && d2 == false && l1 == false && r1 == false && r2 == false && l2 == false && eeb == false)
  {
    eetime++;
    if (touche == "D" && eetime <=120)
    {
        d2 = true;
        d1 = false;
        touche = "Null";
        eetime = 0;
        println("D2");
    }
    else if (eetime > 120)
    {
      eetime = 0;
      d1 = false;
    }
  }
  
  if (d2 == true && u1 == false && u2 == false && d1 == false && l1 == false && r1 == false && r2 == false && l2 == false && eeb == false)
  {
    eetime++;
    if (touche == "L" && eetime <=120)
    {
        l1 = true;
        d2 = false;
        touche = "Null";
        eetime = 0;
        println("L1");
    }
    else if (eetime > 120)
    {
      eetime = 0;
      d2 = false;
    }
  }
  
  if (l1 == true && u1 == false && u2 == false && d1 == false && d2 == false && r1 == false && r2 == false && l2 == false && eeb == false)
  {
    eetime++;
    if (touche == "R" && eetime <=120)
    {
        r1 = true;
        l1 = false;
        touche = "Null";
        eetime = 0;
        println("R1");
    }
    else if (eetime > 120)
    {
      eetime = 0;
      l1 = false;
    }
  }
  
  if (r1 == true && u1 == false && u2 == false && d1 == false && d2 == false && l1 == false && r2 == false && l2 == false && eeb == false)
  {
    eetime++;
    if (touche == "L" && eetime <=120)
    {
        l2 = true;
        r1 = false;
        touche = "Null";
        eetime = 0;
        println("L2");
    }
    else if (eetime > 120)
    {
      eetime = 0;
      r1 = false;
    }
  }
  
  if (l2 == true && u1 == false && u2 == false && d1 == false && d2 == false && r1 == false && r2 == false && l1 == false && eeb == false)
  {
    eetime++;
    if (touche == "R" && eetime <=120)
    {
        r2 = true;
        l2 = false;
        touche = "Null";
        eetime = 0;
        println("R2");
    }
    else if (eetime > 120)
    {
      eetime = 0;
      l2 = false;
    }
  }
  
  if (r2 == true && u1 == false && u2 == false && d1 == false && d2 == false && r1 == false && l1 == false && l2 == false && eeb == false)
  {
    eetime++;
    if (touche == "B" && eetime <=120)
    {
        eeb = true;
        r2 = false;
        touche = "Null";
        eetime = 0;
        println("B");
    }
    else if (eetime > 120)
    {
      eetime = 0;
      r2 = false;
    }
  }
  
  if (eeb == true && u1 == false && u2 == false && d1 == false && d2 == false && r1 == false && r2 == false && l1 == false && l2 == false)
  {
    eetime++;
    if (touche == "A" && eetime <=120)
    {
        konami = true;
        eeb = false;
        touche = "Null";
        eetime = 0;
        println("A");
    }
    else if (eetime > 120)
    {
      eetime = 0;
      eeb = false;
    }
  }
  
  
  if(konami == true)
  {
    if (k_switch == false)
    {
      k_switch = true;
      konami = false;
      konamisound.rewind(); //Joue le son
      konamisound.play();   //
    }
    else
    {
      k_switch = false; //
      bgcolor = 0;      //Remet le background en noir
      konami = false;   //
    }
  }
  
  if (k_switch == true && frameCount%30 == 0) //Exécute ceci toute les 30 frames
  {
    bgcolor = int(random(16777216)); //Une couleur au hasard parmi les 16777216 possibles
  }
}
