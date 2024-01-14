import ddf.minim.*;
import SimpleOpenNI.*; //trucs kinect : l2 l27 l53-58 l117 l119 + onglet kinect + onglet settings l.119-120

int jan_fev,annee2,mois2,jour2;
int alpha_splash,bgcolor;
int eetime;
float xref,yref,accel;
float d_width, dw_width,h_width,pp_width;
float w_splash,size_splash;
String annee,mois,jour,heure,minute,date,heure_globale,d_week;
String text_splash;
String mouvement,page,touche;
boolean splash,transition,lock,run_once,run_twice,wiki_error,web_error;
PFont Thin18,Thin36,Thin48,Thin72,Thin144,Splash144,ThinI24,Light18;
PImage wrench,lockpic,userpic;
PImage Soleil;    
PImage Brokenclouds;
PImage Brouillard;
PImage Fewclouds;
PImage Orageviolent;
PImage Pluiediluvienne;
PImage Pluiefine;
PImage Scatteredclouds;
PImage Snow, moon, nightClouds;
Minim minim;
AudioPlayer konamisound;
SimpleOpenNI kinect;

String weatherLink = "http://api.openweathermap.org/data/2.5/weather?q=Paris&mode=xml&appid=acd0bb48bc0fdeb8cba88756459bbe58&lang=fr&units=metric";
String newsLink = "http://www.bfmtv.com/rss/info/flux-rss/flux-toutes-les-actualites/";

void setup()
{
  frameRate(30);
  //size(720,1280); //Utilisé lors des tests
  size(900,1600); //Utilisé lors des tests
  //fullScreen();
  background(0);
  Splash144 = loadFont("font/Splash144.vlw");
  minim = new Minim(this);
  splash = true; //Activer le splash au démarrage
  alpha_splash = 0; //Transparence du splash
  text_splash = "SmartMirror";
  selected_setting = 0;
  bgcolor = 0; //Couleur par défaut du background
  xref = 0; //x de référence
  yref = 0; //y de référence
  accel = 0; //Accélération, nécéssaire pour une transition fluide
  transition = false; //Pas de transition en cours par défaut
  k_switch = false; //EasterEgg non activé par défaut (k_switch = konami switch)
  lock = false; //Miroir non bloqué par défaut
  page = "M"; //La page par défaut est celle du milieu
  mois();
  kinect = new SimpleOpenNI(this);//
  kinect.enableDepth();           //Initialisation camera de profondeur
  kinect.enableRGB();
  kinect.enableUser();//Active tracking du haut du corps 
  kinect_coolDown = 0;
  set0_alpha = 255;
  set1_alpha = 63;
  set2_alpha = 63;
  System.setProperty("java.net.useSystemProxies", "true");
}

void draw()
{
  if (splash==true) //Exécute le splash, puis remet le splash à false
  {
    splash();
  }
  else
  {
    background(bgcolor);
    if (bgcolor > 0 && k_switch == false)
    {
      bgcolor -= 5; //Fondu vers le noir du background
    }
    annee=str(year());    //
    jour=str(day());      //Convertir les valeurs int en String afin de mieux les manipuler
    heure=str(hour());    //
    minute=str(minute()); //
    if (hour()<10)           //
    {                        //
      heure = "0"+heure;     //
    }                        //
    if (minute()<10)         //Rajoute un 0 à l'heure afin de donner quelque chose comme 02:08 au lieu de 2:8
    {                        //
      minute = "0"+minute;   //
    }                        //
    jour_semaine();//Algo des jours de la semaine(Lundi,Mardi,Mercredi...)
    mois();//Converti la valeur numérique du mois en mot dans une variable String
    heure_globale = heure + ":" + minute; //Met l'heure et les minutes sur la même variable String
    date = d_week + " " + jour + " " + mois;//Met les elements de date sur la même variable String
    textSize(48);                        //
    d_width = textWidth(date);           //
    textSize(144);                       //Largeur des éléments de la date
    h_width = textWidth(heure_globale);  //
    textFont(Thin144);
    text(heure_globale,xref+width/2-h_width/2,yref+height/6-144/2);//Place le texte au milieu de l'écran
    textFont(Thin48);                                                
    text(date,xref+width/2-d_width/2,yref+height/6-144/2+50);        
    text("Informations",xref-width/2-textWidth("Informations")/2,yref+48/2+50);//Place le texte au milieu de l'écran
    text("Paramètres",xref+width/2-textWidth("Paramètres")/2,yref-height*5/6-48/2+50);//Place le texte au milieu de l'écran
    noTint();
    image(wrench,xref+width/2-64,yref-height*11/12-64);
    textFont(ThinI24);
    textSize(18);
    textFont(Thin18);
    textSize(18);
    kinect.update(); 
    
    kinectmvmt();
    parametres();
    picto();
    page();
    mvmt();
    easter();
    lock();
    informations();
    meteo();
    touche = "Null";
    if(run_once == true)
    {
      run_once = false;
    }
    tracking = false;
    //rect(width/2,0,2,1600);
    //fill(255);
  }
}
