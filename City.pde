/**
  * The city class lets us instantiate cities
  * with a common configuration.
  */
class City {
  // A property representing the name of the city
  String name;
  
  // X coordinate of the city
  int x;
  
  // Y coordinate of the city
  int y;
  
  // Airplane image
  PImage plane;
  
  public City(String name, int x, int y, PImage plane) {
    this.name = name;
    this.x = x;
    this.y = y;
    this.plane = plane;
  }
}