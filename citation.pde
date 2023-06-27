String citation_url,citation_html,citation,citation2,auteur_html,auteur,jourqotd,moisqotd,anneeqotd;
int balise1, balise2,balise3,balise4,brindex1,brindex2,citsplit,cit2split,mindex;
float cit_length,cit2_length,aut_length;
boolean run_qotd,cit_error;

void citation()
{
  if((run_once == true || run_qotd == true || (hour()==1 && minute()==0 && second()==0 && frameCount%30==0)) && wiki_error != true) //Rafraichis tout les jours à 01:00
  {
    if(run_qotd == true)
    {
      run_qotd = false;
    }
    citation = "";
    citation2 = ""; //Récupère la citation du jour dans un fichier .html
    try
    {
      String[] qotd = loadStrings("https://fr.wikiquote.org/wiki/Modèle:Citation_du_jour/"+jourqotd+"_"+moisqotd+"_"+anneeqotd);
      citation_html = qotd[42]+qotd[43]; //Récupère les ligne 42, 43 (Celles de la citation)
    }
    catch(NullPointerException npe)
    {
      cit_error = true;
    }
    catch(IndexOutOfBoundsException ioobe)
    {
      cit_error = true;
    }
    if(cit_error != true)
    {
      String[] qotd = loadStrings("https://fr.wikiquote.org/wiki/Modèle:Citation_du_jour/"+jourqotd+"_"+moisqotd+"_"+anneeqotd);
      citation_html = qotd[42]+qotd[43]; //Récupère les ligne 42, 43 (Celles de la citation)
      balise1 = citation_html.indexOf("<i>")+3; //Détecte où se trouve la balise de texte
      balise2 = citation_html.indexOf("</i>", balise1);
      citation = citation_html.substring(balise1,balise2);
      brindex1 = citation.indexOf("<");
      brindex2 = citation.indexOf(">");
      if (brindex1 != -1 && brindex2 != -1)//Si il y a une balise de retour à la ligne(</br>) alors prendre la partie avant pour la ligne 1 et la partie après pour la ligne 2
      {
        citation2 = citation.substring(0,brindex1);
        citation = citation.substring(brindex2+1);
      }
      String[] cit_mots = split(citation,' ');//Sépare tout les mots, afin des les analyser et de détécter des caractères incorrects, tels que "&#132;", en sachant qu'ils se situtent toujours entre "&" et ";"
      citsplit = cit_mots.length;
      for (int i=0;i<citsplit;i++)
      {
        if (cit_mots[i].indexOf("&") != -1)
        {
          cit_mots[i] = "" + cit_mots[i].substring(0,cit_mots[i].indexOf("&")) +" "+ cit_mots[i].substring(cit_mots[i].indexOf(";")+1);
        }
      }
      String[] cit2_mots = split(citation2,' ');
      cit2split = cit2_mots.length;
      for (int i=0;i<cit2split;i++)
      {
        if (cit2_mots[i].indexOf("&") != -1)
        {
          cit2_mots[i] = "" + cit2_mots[i].substring(0,cit2_mots[i].indexOf("&")) +" "+ cit2_mots[i].substring(cit2_mots[i].indexOf(";")+1);
        }
      }
      citation = "";//Remet les citations à zéro(les mots sont stockés dans cit_mots)
      citation2 = "";
      for (int i=0;i<citsplit;i++)//Réassembler les mots
      {
        citation = citation + cit_mots[i] + " ";
      }
      for (int i=0;i<cit2split;i++)
      {
        citation2 = citation2 + cit2_mots[i] + " ";
      }
      textSize(18);
      cit_length = textWidth(citation);
      cit2_length = textWidth(citation2);
      if (cit_length > width-50 && (brindex1 == -1 || brindex2 == -1))//Si la largeur de la citation est trop grande et que la citation ne fait qu'une ligne,diviser la citation en 2 lignes
      {
        if (citsplit % 2 != 0)
        {
          mindex = citsplit/2+1;
        }
        else
        {
          mindex = citsplit/2;
        }
        citation = "";
        for (int i=0;i<mindex;i++)//réassembler les mots sur les deux lignes
        {
          citation2 = citation2 + cit_mots[i] + " ";
          citation = citation + cit_mots[citsplit-mindex+i] + " ";
        }
        cit_length = textWidth(citation);
        cit2_length = textWidth(citation2);
      }
      if (cit_length > width-50 || cit2_length > width-50)//Si malgrès tout, la citation est trop grande, prendre celle du jour d'avant
      {
        if (day() != 1)
        {
          jourqotd = str(day()-1);
        }
        else
        {
          if(moisqotd == "décembre")
          {
            moisqotd = "novembre";
            jourqotd = "30";
          }
          else if(moisqotd == "novembre")
          {
            moisqotd = "octobre";
            jourqotd = "31";
          }
          else if(moisqotd == "octobre")
          {
            moisqotd = "septembre";
            jourqotd = "30";
          }
          else if(moisqotd == "septembre")
          {
            moisqotd = "août";
            jourqotd = "31";
          }
          else if(moisqotd == "août")
          {
            moisqotd = "juillet";
            jourqotd = "31";
          }
          else if(moisqotd == "juillet")
          {
            moisqotd = "juin";
            jourqotd = "30";
          }
          else if(moisqotd == "juin")
          {
            moisqotd = "mai";
            jourqotd = "31";
          }
          else if(moisqotd == "mai")
          {
            moisqotd = "avril";
            jourqotd = "30";
          }
          else if(moisqotd == "avril")
          {
            moisqotd = "mars";
            jourqotd = "31";
          }
          else if(moisqotd == "mars")
          {
            moisqotd = "février";
            if(year()%4 == 0 && year()%100 != 0 || year()%400 == 0)//Année bisextile
            {
              jourqotd = "29";
            }
            else
            {
              jourqotd = "28";
            }
          }
          else if(moisqotd == "février")
          {
            moisqotd = "janvier";
            jourqotd = "31";
          }
          else if(moisqotd == "janvier")
          {
            moisqotd = "décembre";
            jourqotd = "31";
            anneeqotd = str(year()-1);
          }
        }
        run_qotd = true;
      }
      auteur_html = citation_html.substring(balise2);//Detecte l'auteur
      balise3 = auteur_html.indexOf("\">")+2;
      balise4 = auteur_html.indexOf("</a>",balise3);
      auteur = "-" + auteur_html.substring(balise3,balise4);
      textSize(18);
      aut_length = textWidth(auteur);
    }
    
  }
  else if(wiki_error == true)//Si la connexion a Wikiquote est impossible, mettre à false
  {
    citation = "";
    citation2 = "";
    cit_length = 0;
    cit2_length = 0;
    auteur = "";
    aut_length = 0;
  }
}
