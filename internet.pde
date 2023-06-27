boolean bfm_error;

void internet()
{
  try
  {
    String[] test = loadStrings("https://fr.wikiquote.org/wiki/Modèle:Citation_du_jour/"+jourqotd+"_"+moisqotd+"_"+anneeqotd);
    String test2 = test[42]+test[43];
    println(test2);
  }
  catch(NullPointerException npe)
  {
    wiki_error = true;
  }
  catch(IndexOutOfBoundsException ioobe)
  {
    wiki_error = true;
  }
  try
  {
    String[] test = loadStrings("http://www.google.com/");
    String test2 = test[0]+test[1];
    println(test[0]);
  }
  catch(NullPointerException npe)
  {
    web_error = true;
    println("npe");
  }
  catch(IndexOutOfBoundsException ioobe)
  {
    web_error = true;
    println("ioobe");
  }
}
