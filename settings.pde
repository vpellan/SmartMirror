int selected_setting, set0_alpha, set1_alpha, set2_alpha, tempo;//Celui ci decale uniquement le texte des parametres./
boolean setting_launch;
PImage up, down, left, right, a_key, b_key, n_up, n_down, n_left, n_right, n_a_key, n_b_key, clap, info, kinect_pic;
String touchetmp;
String[] credits;

void parametres()
{
  textFont(Thin48);
  if (selected_setting == 0)
  {
    if (set0_alpha < 255)
    {
      set0_alpha += 16;
    }
  }
  else
  {
    if (set0_alpha > 63)
    {
      set0_alpha -= 16;
    }
  }
  fill(255, set0_alpha);
  text("À propos de nous", xref+width*1.5-textWidth("À propos de nous")/2, yref-height*5/6-48/2+50);
  tint(255, set0_alpha);
  image(info, xref+width*1.5-textWidth("À propos de nous")/2-178, yref-height*5/6-38,128,128);
  if (selected_setting == 1)
  {
    if (set1_alpha < 255)
    {
      set1_alpha += 16;
    }
  }
  else
  {
    if (set1_alpha > 63)
    {
      set1_alpha -= 16;
    }
  }
  fill(255, set1_alpha);
  text("Caméra", xref+width*1.5-textWidth("À propos de nous")/2, yref-height/2-48/2);
  tint(255,set1_alpha);
  image(kinect_pic, xref+width*1.5-textWidth("À propos de nous")/2-178, yref-height/2-64-48/2,128,128);
  if (selected_setting == 2)
  {
    if (set2_alpha < 255)
    {
      set2_alpha += 16;
    }
  }
  else
  {
    if (set2_alpha > 63)
    {
      set2_alpha -= 16;
    }
  }
  fill(255, set2_alpha);
  text("Test des contrôles", xref+width*1.5-textWidth("À propos de nous")/2, yref-height/6-48/2-50);
  tint(255, set2_alpha);
  image(clap, xref+width*1.5-textWidth("À propos de nous")/2-178, yref-height/6-138,128,128);
  fill(255,255);
  if (page == "Setting1")
  {
    if (touche == "D" && transition == false)
    {
      transition = true;
      if (selected_setting < 2)
      {
        selected_setting += 1;
      }
    }
    if (touche == "U" && transition == false)
    {
      transition = true;
      if (selected_setting > 0)
      {
        selected_setting -= 1;
      }
    }
  }
  if (mouvement == "Setting2" || mouvement == "Exit Setting2" || page == "Setting2" || pagetmp == "Setting2")
  {
    if (selected_setting == 0)
    {
      if(setting_launch == false)
      {
        chargement();
        credits = loadStrings("text/credits.txt");
        setting_launch = true;
      }
      for(int i=0;i<credits.length;i++)
      {
        textFont(Light18);
        fill(255);
        text(credits[i], xref+width*2.5-textWidth(credits[i])/2, yref-height+18*i+171);
      }
      textFont(Thin72);
      text("À propos de nous", xref+width*2.5-textWidth("À propos de nous")/2,yref-height+108);
      fill(0,0);
      stroke(255);
      strokeWeight(5);
      rect(xref+width*2+15,yref-height+144,width-30,height-159,30);
    }
    if (selected_setting == 1)
    {
      if(setting_launch == false)
      {
        chargement();
        setting_launch = true;
      }
      fill(255);
      textFont(Thin72);
      text("Caméra Infrarouge", xref+width*2.5-textWidth("Caméra Infrarouge")/2,yref-height+108);
      text("Caméra Couleur", xref+width*2.5-textWidth("Caméra Couleur")/2,yref-696);
      tint(255,255);
      //image(kinect.depthImage(), xref+width*2.5-320,yref-height+108);
      //image(kinect.rgbImage(), xref+width*2.5-320,yref-588);
    }
    if(selected_setting == 2)
    {
      if(setting_launch == false)
      {
        chargement();
        setting_launch = true;
        up = loadImage("pic/up.png");
        down = loadImage("pic/down.png");
        left = loadImage("pic/left.png");
        right = loadImage("pic/right.png");
        a_key = loadImage("pic/a_key.png");
        b_key = loadImage("pic/b_key.png");
        n_up = loadImage("pic/n_up.png");
        n_down = loadImage("pic/n_down.png");
        n_left = loadImage("pic/n_left.png");
        n_right = loadImage("pic/n_right.png");
        n_a_key = loadImage("pic/n_a_key.png");
        n_b_key = loadImage("pic/n_b_key.png");
      }
      fill(255);
      textFont(Thin72);
      text("Test des contrôles", xref+width*2.5-textWidth("Test des contrôles")/2,yref-height+108);
      textFont(Thin48);
      text("Veuillez verrouiller votre SmartMirror", xref+width*2.5-textWidth("Veuillez verrouiller votre SmartMirror")/2,yref-height+160);
      text("afin de tester tout les contrôles", xref+width*2.5-textWidth("afin de tester tout les contrôles")/2,yref-height+210);
      if(touche == "L" || touchetmp == "L")
      {
        touchetmp = "L";
        if (tempo <= 10)
        {
          tempo++;
          image(n_left, xref+width*2, yref-width/3,width/3,width/3);
        }
        else
        {
          tempo = 0;
          touchetmp = "Null";
          image(n_left, xref+width*2, yref-width/3,width/3,width/3);
        }
      }
      else
      {
        image(left, xref+width*2, yref-width/3,width/3,width/3);
      }
      if(touche == "D" || touchetmp == "D")
      {
        touchetmp = "D";
        if (tempo <= 10)
        {
          tempo++;
          image(n_down, xref+width*7/3, yref-width/3,width/3,width/3);
        }
        else
        {
          tempo = 0;
          touchetmp = "Null";
          image(n_down, xref+width*7/3, yref-width/3,width/3,width/3);
        }
      }
      else
      {
        image(down, xref+width*7/3, yref-width/3,width/3,width/3);
      }
      if(touche == "R" || touchetmp == "R")
      {
        touchetmp = "R";
        if (tempo <= 10)
        {
          tempo++;
          image(n_right, xref+width*8/3, yref-width/3,width/3,width/3);
        }
        else
        {
          tempo = 0;
          touchetmp = "Null";
          image(n_right, xref+width*8/3, yref-width/3,width/3,width/3);
        }
      }
      else
      {
        image(right, xref+width*8/3, yref-width/3,width/3,width/3);
      }
      if(touche == "U" || touchetmp == "U")
      {
        touchetmp = "U";
        if (tempo <= 10)
        {
          tempo++;
          image(n_up, xref+width*7/3, yref-width*2/3,width/3,width/3);
        }
        else
        {
          tempo = 0;
          touchetmp = "Null";
          image(n_up, xref+width*7/3, yref-width*2/3,width/3,width/3);
        }
      }
      else
      {
        image(up, xref+width*7/3, yref-width*2/3,width/3,width/3);
      }
      if(touche == "B" || touchetmp == "B")
      {
        touchetmp = "B";
        if (tempo <= 10)
        {
          tempo++;
          image(n_b_key, xref+width*8/3, yref-width,width/3,width/3);
        }
        else
        {
          tempo = 0;
          touchetmp = "Null";
          image(n_b_key, xref+width*8/3, yref-width,width/3,width/3);
        }
      }
      else
      {
        image(b_key, xref+width*8/3, yref-width,width/3,width/3);
      }
      if(touche == "A" || touchetmp == "A")
      {
        touchetmp = "A";
        if (tempo <= 10)
        {
          tempo++;
          image(n_a_key, xref+width*2, yref-width,width/3,width/3);
        }
        else
        {
          tempo = 0;
          touchetmp = "Null";
          image(n_a_key, xref+width*2, yref-width,width/3,width/3);
        }
      }
      else
      {
        image(a_key, xref+width*2, yref-width,width/3,width/3);
      }
    }
  } 
  else if(page == "Setting1")
  {
    credits = null;
    setting_launch = false;
    up = null;
    down = null;
    left = null;
    right = null;
    a_key = null;
    b_key = null;
    n_up = null;
    n_down = null;
    n_left = null;
    n_right = null;
    n_a_key = null;
    n_b_key = null;
  }
}