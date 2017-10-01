/** 
  * The state class contains some properties 
  * about where we are at a given moment.
  */
class State {
  
  // Property indicating current position
  PVector position;
  
  // Property indicating current velocity
  PVector velocity;
  
  // Index of the current city in `cities` array
  int city = 0;
  
  PImage airplane;
  
  int inc = 1;
}