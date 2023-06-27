String pagetmp;
int lock_alpha;

void lock()
{
  tint(255,lock_alpha); //Teinte du pictogramme
  image(lockpic,20,20,width/10,width/10); //Apparition du pictogramme
  if (touche == "Lock") //Exécute ceci lors de l'appui sur la touche Entrée
  {
    if (lock == false) //Vérifie si le lock n'est pas déjà enclenché
    {
      {
        lock = true;     //Permet une vérification future
      }
      if (page != "Lock")
      {
        pagetmp = page;  //Sauvegarde la page actuelle
      }
      page = "Lock";     //Permet de ne pas éxécuter les actions de changement de page
    }
    else
    {
      {
        lock = false;
        page = pagetmp;  //Reprend la valeur de la page précédemment enregistrée
        pagetmp = "Null";
      }
      
    }
  }
  if (page == "Lock")
  {
    if(lock_alpha<255)
    {
      lock_alpha += 15;//Fait apparaitre le pictogramme
    }    
  }
  else
  {
    if (lock_alpha>0)
    {
      lock_alpha -= 15;    //Fait disparaître le pictogramme
    }
  }
}
    
