void jour_semaine()   //Algorithme de Mike Keith afin de savoir le jour de la semaine (valable uniquement jusqu'à l'année 9999) + conversion variable num. au jour correspondant
{
  jan_fev=(14-month())/12;
  annee2 = year()-jan_fev;
  mois2 = month() + 12*jan_fev - 2;
  jour2 = (day() + annee2 + annee2/4 - annee2/100 + annee2/400 + (31*mois2)/12 ) % 7;
  if (jour2==0)
  {
  d_week = "Dimanche";
  }
  else if (jour2==1)
  {
  d_week = "Lundi";
  }
  else if (jour2==2)
  {
  d_week = "Mardi";
  }
  else if (jour2==3)
  {
  d_week = "Mercredi";
  }
  else if (jour2==4)
  {
  d_week = "Jeudi";
  }
  else if (jour2==5)
  {
  d_week = "Vendredi";
  }
  else if (jour2==6)
  {
  d_week = "Samedi";
  }
}
