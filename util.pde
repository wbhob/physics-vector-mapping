public void computeVelocityChange() {
  City currentCity = cities.get(state.city);
  City nextCity;
  if (state.city + 1 <= cities.size() - 1) {
    nextCity = cities.get(state.city + 1);
  } else {
    nextCity = cities.get(cities.size() - 1);
  }
  
  PVector deltaVelocity = new PVector((nextCity.x - 16) - (currentCity.x- 16), (nextCity.y - 16) - (currentCity.y - 16));
  
  
  PVector unitVelocity = deltaVelocity.copy();
  unitVelocity.normalize();
  
  
  
  state.airplane = currentCity.plane;
  
  if (state.city == 3) {
    unitVelocity.x = 0 - unitVelocity.x;
  }
  

  deltaVelocity = unitVelocity.copy().mult(globals.stepsPerDraw);
  
  if (state.city == 3) {
    PVector v = new PVector(globals.headwind(), globals.crosswind());
    if (state.inc == 1) {
      deltaVelocity.add(v);
      globals.drawsForWind++;
      if (globals.drawsForWind > globals.maxDraws) state.inc = 0;
    }
    if(state.inc == 0) {
      v.x = -v.x;
      deltaVelocity.sub(v);
      globals.drawsForWind--;
      if (globals.drawsForWind < 0) state.inc = 2;
    }
  }
  
  state.velocity.x = deltaVelocity.x;
  state.velocity.y = deltaVelocity.y;
  if (state.position.x >= width - 15) {
    state.position.x = 16;
  }
  if (state.position.x < 15) {
    state.position.x = width - 16;
  }
  if (state.position.y >= height - 15 || state.position.y <= 15) {
    state.velocity.y = 0 - state.velocity.y;
  }
  
  if (isInVicinity(nextCity.x, nextCity.y)) {
    state.city += 1;
  } 
  if (state.city + 1 >= cities.size()) {
    state.city = 4;
  }
  int q = 0;
  while(q < state.city) {
    City one = cities.get(q);
    City two = cities.get(q + 1);
    if (q != 3) {
      line(one.x + 16, one.y + 16, two.x + 16, two.y + 16);
    } else {
      line(one.x + 16, one.y + 16, width, two.y + 16);
      line(0, one.y + 16, two.x, two.y + 16);
    }
    
    q++;
  }

    if (q != 3) {
      line(currentCity.x + 16, currentCity.y + 16, state.position.x + 16, state.position.y + 16);
    } else {
      if (state.position.x < nextCity.x) {
        line(currentCity.x + 16, currentCity.y + 16, width, state.position.y + 16);
        line(0, currentCity.y + 16, state.position.x + 16, state.position.y + 16);
      } else {
        line(currentCity.x + 16, currentCity.y + 16, state.position.x + 16, state.position.y + 16);
      }
    }
  
  
}

public boolean isInVicinity(int x, int y) {
  boolean inXVicinity = (state.position.x >= (x - 16) && state.position.x <= (x + 16));
  boolean inYVicinity = (state.position.y >= (y - 16) && state.position.y <= (y + 16));
  return inXVicinity && inYVicinity;
}