 int kinect_coolDown;
float[] distances10 = new float[10];
PVector[] lHandPos = new PVector[10];
PVector[] rHandPos = new PVector[10];
PVector lHandMove, rHandMove;
boolean stopMove,tracking,lockTmp;

/* void kinectmvmt() 
{
  stroke(255, 0, 0);
  strokeWeight(5);
  IntVector userList = new IntVector(); //Nouvelle liste de IntVector
  kinect.getUsers(userList); //Insère les personnes présente dans le cadre dans la liste userList
  if (userList.size() > 0) //Verifie si qqn a déjà été dans le cadre
  {
    int userId = userList.get(0);//userID prend la premiere valeure de la liste userList
    if ( kinect.isTrackingSkeleton(userId)) //Verifie si qqn est dans le cadre
    {
      tracking = true; //Utilisé pour le pictogramme de l'utilisateur
      PVector leftHand = new PVector();//Créer la variable des coordonnées de la main gauche
      PVector rightHand = new PVector();//De même pour la main droite
      kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_HAND, leftHand);
      kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_HAND, rightHand);
      PVector differenceVector = PVector.sub(leftHand, rightHand);//Calcule la différence entre les deux vecteurs
      float magnitude = differenceVector.mag();//Calcule la distance
      differenceVector.normalize();//Transforme le vecteur en vecteur unitaire, non utilisé par la suite mais utilisé par la librairie SimpleOpenNI
      for (int i=0;i<9;i++)
      {
        distances10[i]=distances10[i+1];
      }
      distances10[9]=magnitude;
      if (distances10[9] <= 80)
      {
        for (int i=0;i<9;i++)
        {
          if (distances10[i] >=150)
          {
            touche = "Lock";
            lockTmp = true;
          }
        }
      }
      if(lockTmp == true)
      {
        lockTmp = false;
        for(int i=0;i<9;i++)
        {
          distances10[i]=0;
        }
      }
      stroke(0, 0, 0);
      strokeWeight(0);
      for (int i=0;i<9;i++)
      {
        lHandPos[i] = lHandPos[i+1];
        rHandPos[i] = rHandPos[i+1];
      }
      lHandPos[9] = leftHand;
      rHandPos[9] = rightHand;
      if (lHandPos[0] == null)
      {
        println(lHandPos[9]);
        println(rHandPos[9]);
      }
      else
      {
        lHandMove = PVector.sub(lHandPos[9], lHandPos[0]);
        rHandMove = PVector.sub(rHandPos[9], rHandPos[0]);
        if (lHandPos[0].mag() != 0 && rHandPos[0].mag() != 0 && lHandPos[9].mag() != 0 && rHandPos[9].mag() != 0 && stopMove != true) //Verifie si le 1er et le 10eme vecteur n'est pas nul, afin d'empecher la soustraction par 0
        {
          if ((lHandMove.x >= 10 || lHandMove.x <= -10) && (lHandMove.y >= 10 || lHandMove.y <= -10) && (lHandMove.z >= 10 || lHandMove.z <= -10) && (rHandMove.x >= 10 || rHandMove.x <= -10) && (rHandMove.y >= 10 || rHandMove.y <= -10) && (rHandMove.z >= 10 || rHandMove.z <= -10))
          {
          
          }
          else
          {
            if ((sq(lHandMove.x) > sq(lHandMove.y) && lHandMove.x <= -150) || (sq(rHandMove.x) > sq(rHandMove.y) && rHandMove.x <= -150)) //Detecte si le mouvement est plus vers la gauche que vers le haut,  et s'il est assez conséquent
            {
              touche = "R";
            }
            if ((sq(lHandMove.x) > sq(lHandMove.y) && lHandMove.x >= 150) || (sq(rHandMove.x) > sq(rHandMove.y) && rHandMove.x >= 150))
            {
              touche = "L";
            }
            if ((sq(lHandMove.y) > sq(lHandMove.x) && lHandMove.y >= 150) || (sq(rHandMove.y) > sq(rHandMove.x) && rHandMove.y >= 150))
            {
              touche = "U";
            }
            if ((sq(lHandMove.y) > sq(lHandMove.x) && lHandMove.y <= -150) || (sq(rHandMove.y) > sq(rHandMove.x) && rHandMove.y <= -150))
            {
              touche = "D";
            }
            if (sq(lHandMove.z) > sq(lHandMove.x)+sq(lHandMove.y) && lHandMove.z <= -150)//Verifie si le déplacement en z est plus grand que le déplacement en x et y
            {
              touche = "B";
            }
            if (sq(rHandMove.z) > sq(rHandMove.x)+sq(rHandMove.y) && rHandMove.z <= -150)//Verifie si le déplacement en z est plus grand que le déplacement en x et y
            {
              touche = "A";
            }
            for(int i=0;i>9;i++)
            {
              lHandPos[i].set(0,0,0);
              rHandPos[i].set(0,0,0);
            }
            lHandMove.set(0,0,0);
            lHandMove.set(0,0,0);
            stopMove = true;
          }
        }
      }
    }
  }
  if(stopMove == true)
  {
    if (kinect_coolDown <= 10)
    {
      kinect_coolDown++;
    }
    else
    {
      kinect_coolDown = 0;
      stopMove = false;
    }
  }
}

// Rappel du tracking de l'utilisateur
void onNewUser(int userId) 
{
  println("start pose detection");
  kinect.startPoseDetection("Psi", userId);
}

void onEndCalibration(int userId, boolean successful) 
{
  if (successful) 
  {
    println(" User calibrated !!!");
    kinect.startTrackingSkeleton(userId);
  }
  else 
  {
    println(" Failed to calibrate user !!!");
    kinect.startPoseDetection("Psi", userId);
  }
}

void onStartPose(String pose, int userId) 
{
  println("Started pose for user");
  kinect.stopPoseDetection(userId);
  kinect.requestCalibrationSkeleton(userId, true);
} */