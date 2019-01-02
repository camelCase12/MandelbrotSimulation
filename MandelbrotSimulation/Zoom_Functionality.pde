mouseCoordinate firstMouseCoordinate = new mouseCoordinate();
mouseCoordinate lastMouseCoordinate = new mouseCoordinate();

class mouseCoordinate {
 float x;
 float y;
}

class zoomBound {
  float left = -2;
  float right = 2;
  float top = 2;
  float bottom = -2;
}

float findXCoordinate(complexNumber c) {
  float xCoord = 0;
  
  xCoord = 1000 * ((c.real - mandelbrotBound.left) / (mandelbrotBound.right - mandelbrotBound.left));
  
  return xCoord;
}

float findYCoordinate(complexNumber c) {
  float yCoord = 0;
  
  yCoord = 1000 * ((c.imaginary - mandelbrotBound.top) / (mandelbrotBound.bottom - mandelbrotBound.top));
  
  return yCoord;
}
