/********************************
/ John Capogna
/ marioAndBoo.pde
/ ITP, 2012
********************************/

PImage mario;
PImage boo;
PImage marioDead;
PImage bg;
float booX = 80;
float booY = 115;
float marioX = 655;
float marioY = 390;
boolean arrived = false;
boolean rising = true;

void setup() {
  size(800, 488);
  frameRate(90);
  // Make new instances of a PImage by loading an image file
  mario = loadImage("mario.png");
  boo = loadImage("boo.png");
  bg = loadImage("bg.png");
  marioDead = loadImage("marioDead.png");
}

void draw() {
  background(bg);
    if(mouseX > marioX) {   // if mouse is to the right of Mario
      if(booX == 580) {     // boo has reached Mario when booX is 580
      arrived = true;
    }
    if (arrived == false) { // while boo has not arrived
      pushMatrix();         // and while Mario faces right
      imageMode(CENTER);
      image(mario, marioX, marioY);
      popMatrix();
    }
      pushMatrix();         // Boo advances while (x < 655)
      imageMode(CENTER);
      if (arrived == false) {  // and boo hasn't arrived yet
        booX += 1;
        booY += 0.5;
      }
      image(boo, booX, booY);
      popMatrix();    
                            // else: mouse is to the left of Mario
  } else {
    if(arrived == false) {  // Mario faces left
      pushMatrix();         // and only while condition arrived is false
    scale(-1, 1);           // reverse his image
    imageMode(CENTER);
    image(mario, -marioX, marioY);
    popMatrix();
    }
                            // Boo goes invisible whie cursor is to left
    pushMatrix();
    imageMode(CENTER);
    tint(255, 35);          // make transparent
    image(boo, booX, booY);
    noTint();               // noTint so other images are not transparent
    popMatrix(); 
  }
  
                            // when boo reaches Mario
  if (arrived == true) {
    imageMode(CENTER);
    if (rising == true) {   // Mario rises
      marioY += -8;
    } else {                // Mario falls
      marioY += 8;
    }
    
    if (marioY < 315) {     // condition: when marioY < 315
      rising = false;
    }
    
    image(marioDead, marioX, marioY);   // new Mario image
  }
}
