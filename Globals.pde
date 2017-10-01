class Globals {
  float stepsPerDraw = 1.7;
  PImage background;
  float angle = 43;
  int drawsForWind = 0;
  int maxDraws = 40;
  
  
  float headwind() {return 1.5;}

  float crosswind() {return this.drawsForWind * .1;}
}