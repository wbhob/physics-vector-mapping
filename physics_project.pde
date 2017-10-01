// GLOBAL CONFIGURATION
Globals globals = new Globals();

// LOCAL VARIABLES
// Instantiate the state manager
State state = new State();

// Create an array of cities to reference later
ArrayList<City> cities = new ArrayList<City>();

// a group of airplanes to choose from
Airplanes airplanes;

public void setup() {
  
  // Instantiate the airplanes object.
  // This is done here because loadImage is 
  // asynchronous, so it has to be called when
  // Proccessing is ready.
  
  airplanes = new Airplanes();
 
  // This block sets up cities to the global cities array.
  cities.add(new City("Atlanta", 264, 244, airplanes.northwest));
  cities.add(new City("Seattle", 157, 204, airplanes.southeast));
  cities.add(new City("Sao Paulo", 380, 416, airplanes.northeast));
  cities.add(new City("Kabul", 684, 224, airplanes.east));
  cities.add(new City("Atlanta", 264, 244, airplanes.east));
  
  // set the size of our canvas
  size(1000, 675);
  
  // Draw the background map
  globals.background = loadImage("world-map.jpg");
  globals.background.resize(width, height);
  background(globals.background);
  textSize(24);
  
  state.position = new PVector(cities.get(0).x, cities.get(0).y);
  state.velocity = new PVector(0,0);
  
  // Set the original airplane
  state.airplane = airplanes.northwest;
}

public void draw() {
  image(globals.background, 0, 0, width, height);
  image(state.airplane, state.position.x, state.position.y, 32, 32);
  
  computeVelocityChange();
  for (int i = 0; i < cities.size(); i++) {
    City city = cities.get(i);
    ellipse(city.x + 16, city.y + 16, 8, 8);
    text(city.name, city.x + 28, city.y+24);
  }
  
  state.position.add(state.velocity);
}