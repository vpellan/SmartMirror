String ListeAffichage[] = new String[100];   // Définir la liste de character soit une nouvelle liste de 100 ligne 
int Numero_Titre;                           // Prendre une ligne de titre 
int ctr_aff, p2, p3;                               // Définir un tableau de valeur pour temps de l'affichage   
int decalage_aff;                         //  Définir un tableau de valeur pour le décalage des lignes 
int zoneCliquee =0; // Définir zoneCliquee
String[] infos;//Définir infos comme la composé du titre séléctionner lor du clicage de la zone 
String aff_description, titre;// Définir la variable affichage de la description
boolean bfmError;

void informations()
{
  if(erreurGoogle != true)
  {
    if(run_once == true || minute()%10==0 && second()%60==0 && frameCount%30==0)
    {
      if(netLaunch != true)
      {
        infos = loadStrings("http://www.bfmtv.com/rss/info/flux-rss/flux-toutes-les-actualites/"); // Accéder au site d'information bfmtv.
      }
      for (int i=0; i<infos.length; i++)  // Créer un tableaux des valeurs, du site. 
      {
        int p1 = infos[i].indexOf("<title>");
        if (p1 >= 0)                           // Si il trouve p1 soit <= a 0  alors exécute la suite, pour éviter -1 et que l'argument ne soit pas trouvé.
        {
          
          p2 = infos[i].indexOf("<title><![CDATA[")+16;   // Maintenat on cherche le deuxieme croché ouvert de la ligne du "<title><" 
          p3 = infos[i].indexOf("]]></title>");
          if(p2 >=0 && p3 > 0)
          {
            titre = infos[i].substring(p2, p3);   //  Ont extrait les ligne qui corespondent au critére p1 + p2 + p3
          }
          
    
          //affichage = affichage + titre + "\n";   // Permettre le saut à la ligne des données
          if(titre != null)
          {
            ListeAffichage[Numero_Titre] = titre;   // Afficher numero titre qui correspond au titre
            Numero_Titre++;       // mettre au suivant le titre +1
          }
          if(Numero_Titre>90)
          {
            Numero_Titre=0;
          }
        }
      }
    }
    //background(0); // Effacer les précédents titres 
    fill(0); // mettre noir
    for (int i=0;i<10;i++) // Pour un tableau de valeur avec une sélectiion des 10 premier titres
    {
      fill(255);                                            // Déterminer la couleur d'écriture blanche
      if ((i + decalage_aff) >=  (Numero_Titre - 1))
      {
        decalage_aff = 0; // Permettre de remettre à 0 les titres pour éviter le plantage
      }
      textFont(Light18);
      text(ListeAffichage[i + decalage_aff], xref-width+50, yref+200+(i*60));       //Afficher les titres des actualités avec leurs coordonnées
    }
    if(ctr_aff < 300)
    {
      ctr_aff++;
    }
    else
    {
      ctr_aff=0;
      decalage_aff++; // Permettre le decallage de 1 pour chaque titre
    }
  }
  else
  {
    textFont(Thin48);
    text("Connexion internet indisponible...", xref-width/2-textWidth("Connexion internet indisponible...")/2, yref+200);
  }
}
