void renderAll() {
  fill(255); // Move to setup
  stroke(255);
  renderGraphStructure();
}

void renderGraphStructure() { //Call the rendering of each individual structure
renderAxes();
renderOrigin();  
}

void renderAxes() {
  line(0, 501, 1001, 501);
  line(501, 0, 501, 1000);
}

void renderOrigin() {
  ellipse(501, 501, 5, 5);
}

void renderTicks() {
  //This will have to be done carefully, preferably by fourths (approx 62.5 pixels per)
}

void renderMandelbrot(complexNumber c) { //Call this upon verifying mandelbrot number
  stroke(0, 255, 0);
  fill(0, 255, 0);
  
  rect(findXCoordinate(c), findYCoordinate(c), 0, 0);
}

void renderDebug() {
 text("left bound: " + str(mandelbrotBound.left), 20, 20); 
 text("right bound: " + str(mandelbrotBound.right), 20, 40); 
 text("top bound: " + str(mandelbrotBound.top), 20, 60); 
 text("bottom bound: " + str(mandelbrotBound.bottom), 20, 80);
}
