boolean bfm_error;

void internet()
{
  try
  {
    String[] test = loadStrings("http://www.google.com/");
    String test2 = test[0]+test[1];
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
