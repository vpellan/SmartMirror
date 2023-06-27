XML xml;
PrintWriter output;
String[] result;
String value, min, max, value2, name, risestr, setstr, sunrise, sunset, sunriseHour, sunsetHour, value3, number, icon;
  
void meteo()
{
  if((run_once == true || minute()%10==0 && second()==0 && frameCount%30==0) && erreurGoogle != true)
  {
    if(netLaunch != true)
    {
      result = loadStrings("http://api.openweathermap.org/data/2.5/weather?q=Ingre&mode=xml&appid=2217ca13fc78c8c87ec47511c9f18f54&lang=fr&units=metric");
      netLaunch = false;
    }
    output = createWriter("data/text/meteo.xml");
    for(int i=0; i<result.length; i++)
    {
      output.println(result[i]);
    }
    output.flush(); // Writes the remaining data to the file
    output.close(); // Finishes the file
    xml = loadXML("data/text/meteo.xml");
    XML[] children2 = xml.getChildren("clouds");
    XML[] children = xml.getChildren("temperature");
    XML[] children3 = xml.getChildren("city");
    XML[] children4 = children3[0].getChildren("sun");
    XML[] children5 = xml.getChildren("weather");
    for (int i = 0; i < children.length; i++) 
    {
      value = children[i].getString("value");
      min = children[i].getString("min");
      max = children[i].getString("max");
    }
    for (int i=0; i<children2.length; i++) 
    {
      value2 = children2[i].getString("value");
      name = children2[i].getString("name");
    }
    for (int i=0; i<children4.length; i++)
    {
      risestr = children4[i].getString("rise");
      setstr = children4[i].getString("set");
      sunriseHour = str(Integer.parseInt(risestr.substring(risestr.indexOf("T")+1,risestr.indexOf(":")))+2);
      sunsetHour = str(Integer.parseInt(setstr.substring(setstr.indexOf("T")+1,setstr.indexOf(":")))+2);
      sunrise = sunriseHour +"h"+ risestr.substring(risestr.indexOf(":")+1,risestr.length());
      sunset = sunsetHour +"h"+ setstr.substring(setstr.indexOf(":")+1,setstr.length());
    }
    for (int i = 0; i < children5.length; i++) 
    {
      value3 = children5[i].getString("value");
      icon = children5[i].getString("icon");
    }
    if(value == null)
    {
      value = "";
    }
    if(min == null)
    {
      min = "";
    }
    if(max == null)
    {
      max = "";
    }
    if(sunrise == null)
    {
      sunrise = "";
    }
    if(sunset == null)
    {
      sunset = "";
    }
  }
  if(erreurGoogle != true)
  {
    textFont(Thin48);
    text("T° actuelle : "+value,xref+width*5/3 - textWidth("T° actuelle : "+value)/2,yref + 100);
    text("T° minimale : "+min,xref+width*5/3 - textWidth("T° actuelle : "+value)/2,yref + 150);
    text("T° maximale : "+max,xref+width*5/3 - textWidth("T° actuelle : "+value)/2,yref+200);
    text("Lever de soleil : "+sunrise,xref+width*3/2-textWidth("Lever de soleil : "+sunrise)/2,yref+250);
    text("Coucher de soleil : "+sunset,xref+width*3/2-textWidth("Coucher de soleil : "+sunset)/2,yref+300);
    
    tint(255,255);
    if(icon.equals("01d")==true)
    {
      image(Soleil,xref+width*3/2-512/2,yref+height/2-512/2);
    }
    else if(icon.equals("02d")==true)
    {
      image(Fewclouds,xref+width*3/2-512/2,yref+height/2-512/2);
    }
    else if(icon.equals("03d")==true || icon.equals("03n")==true)
    {
      image(Scatteredclouds,xref+width*3/2-512/2,yref+height/2-512/2);
    }
    else if (icon.equals("04d")==true || icon.equals("04n")==true)
    {
      image(Brokenclouds,xref+width*3/2-512/2,yref+height/2-512/2);
    }
    else if(icon.equals("09d")==true || icon.equals("09n")==true)
    {
      image(Pluiediluvienne,xref+width*3/2-512/2,yref+height/2-512/2);
    }
    else if(icon.equals("10d")==true || icon.equals("10n")==true)
    {
      image(Pluiefine,xref+width*3/2-512/2,yref+height/2-512/2);
    }
    else if(icon.equals("11d")==true || icon.equals("11n")==true)
    {
      image(Orageviolent,xref+width*3/2-512/2,yref+height/2-512/2);
    }
    else if(icon.equals("13d")==true || icon.equals("13n")==true)
    {
      image(Snow,xref+width*3/2-512/2,yref+height/2-512/2);
    }
    else if(icon.equals("50d")==true || icon.equals("50n")==true)
    {
      image(Brouillard,xref+width*3/2-512/2,yref+height/2-512/2);
    }
    else if(icon.equals("01n")==true)
    {
      image(moon,xref+width*3/2-512/2,yref+height/2-512/2);
    }
    else if(icon.equals("02n")==true)
    {
      image(nightClouds,xref+width*3/2-512/2,yref+height/2-512/2);
    }
  }
  else
  {
    textFont(Thin48);
    text("Connexion internet indisponible...", xref+width*3/2-textWidth("Connexion internet indisponible...")/2, yref+200);
  }
}
