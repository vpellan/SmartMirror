boolean loading2,loading3,loading4,loading5,loading6,loading7,loading8,loading9,loading10;
boolean loading = true;
boolean loading1 = true;
boolean erreurGoogle, netLaunch;

void splash() //Gère le splash, lors du démarrage du programme
{
  background(bgcolor);
  textSize(144);
  w_splash = textWidth(text_splash);
  textFont(Splash144);
  fill(255, alpha_splash);
  text(text_splash,width/2-w_splash/2,height/2-72); //Arrivée du texte, avec fondu...
  if (alpha_splash<255)
  {
    alpha_splash += 3; //Arrivée en fondu du logo
  }
  else if(loading == true)
  {
    fill(255);
    noStroke();
    rect(width/2-80,height/2,160,20);
    ellipse(width/2-80,height/2+10,20,20);
    ellipse(width/2+80,height/2+10,20,20);
    fill(0);
    rect(width/2-75,height/2+5,150,10);
    ellipse(width/2+75,height/2+10,10,10);
    ellipse(width/2-75,height/2+10,10,10);
    fill(255);
    if(loading1 == true)
    {
      Thin18 = loadFont("font/Thin18.vlw");
      rect(width/2-80,height/2+5,15,10);
      loading1 = false;
      loading2 = true;
    }
    else if(loading2 == true)
    {
      Light18 = loadFont("font/Light18.vlw");  //
      rect(width/2-80,height/2+5,30,10);
      loading2 = false;
      loading3 = true;
    }
    else if(loading3 == true)
    {
      Thin36 = loadFont("font/Thin36.vlw");  //
      rect(width/2-80,height/2+5,45,10);
      loading3 = false;
      loading4 = true;
    }
    else if(loading4 == true)
    {
      Thin48 = loadFont("font/Thin48.vlw");  //Déclarer les polices d'écritures sous différentes tailles
      rect(width/2-80,height/2+5,60,10);
      loading4 = false;
      loading5 = true;
    }
    else if(loading5 == true)
    {
      Thin72 = loadFont("font/Thin72.vlw");  //
      rect(width/2-80,height/2+5,75,10);
      loading5 = false;
      loading6 = true;
    }
    else if(loading6 == true)
    {
      Thin144 = loadFont("font/Thin144.vlw");//
      rect(width/2-80,height/2+5,90,10);
      loading6 = false;
      loading7 = true;
    }
    else if(loading7 == true)
    {
      ThinI24 = loadFont("font/Thin_it24.vlw");
      rect(width/2-80,height/2+5,105,10);
      loading7 = false;
      loading8 = true;
    }
    else if(loading8 == true)
    {
      konamisound = minim.loadFile("sound/konami.wav");//Déclarer le fichier .wav du code konami
      rect(width/2-80,height/2+5,120,10);
      loading8 = false;
      loading9 = true;
    }
    else if(loading9 == true)
    {
      lockpic = loadImage("pic/lock.png"); //Pictogramme de cadenas
      webpic = loadImage("pic/web.png");
      userpic = loadImage("pic/user.png");
      wrench = loadImage("pic/wrench.png");
      kinect_pic = loadImage("pic/kinect.png");
      info = loadImage("pic/info.png");
      clap = loadImage("pic/clap.png");
      Soleil = loadImage("pic/Soleil.png");    
      Brokenclouds = loadImage("pic/Broken clouds.png");
      Brouillard = loadImage("pic/Brouillard.png");
      Fewclouds = loadImage("pic/Few clouds.png");
      Orageviolent = loadImage("pic/Orage.png");
      Pluiediluvienne = loadImage("pic/Pluie.png");
      Pluiefine = loadImage("pic/Pluie fine.png");
      Scatteredclouds = loadImage("pic/Scattered clouds.png");
      Snow = loadImage("pic/Neige.png");
      moon = loadImage("pic/Lune.png");
      nightClouds = loadImage("pic/nightClouds.png");
      rect(width/2-80,height/2+5,135,10);
      loading9 = false;
      loading10 = true;
    }
    else if(loading10 == true)
    {
      internet();
      if(web_error == true)
      {
        erreurGoogle = true;
      }
      else
      {
        result = loadStrings(weatherLink);
        infos = loadStrings("http://www.bfmtv.com/rss/info/flux-rss/flux-toutes-les-actualites/");
        netLaunch=true;
      }
      rect(width/2-80,height/2+5,160,10);
      loading10=false;
      loading=false;
    }
  }
  else if(bgcolor<246)
  {
      bgcolor += 10; //Fondu vers le blanc
  }
  else
  {
    splash = false;
    run_once = true;
  }
}

// 12/05/2017 à 21h23 : 1956 lignes de code
