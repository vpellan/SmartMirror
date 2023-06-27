PImage webpic;
int web_alpha,user_alpha;

void picto()
{
  tint(255,web_alpha);
  image(webpic,xref+width-width/20-20,yref-height+20,width/20,width/20);
  if(web_error == true && frameCount%30 == 0)//Fait clignoter le pictogramme d'Internet si l'accès à Google est impossible(donc fait aussi clignoter si l'horloge n'est pas à l'heure)
  {
    if(web_alpha !=127)
    {
      web_alpha = 127;
    }
    else if(web_alpha == 127)
    {
      web_alpha = 0;
    }
  }
  else if(web_error == false)
  {
    web_alpha = 127;
  }
  tint(255,user_alpha);
  image(userpic,xref+width-width*2/20-20,yref+20,width/20,width/20);
  if (frameCount%30 == 0 && tracking == false)
  {
    if (user_alpha != 0)
    {
      user_alpha = 0;
    }
    else if (user_alpha != 127)
    {
      user_alpha = 127;
    }
  }
  else if(tracking == true)
  {
    user_alpha = 127;
  }
}
