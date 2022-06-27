import java.util.Random;

double leftX = -1.777777777;
double rightX = 1.777777777;
double topY = 1;
double bottomY = -1;

double sampleRate = 5000;

Random rnd = new Random();

Boolean scanFlag = true;

void setup() {
  size(1920, 1080);
  background(0);
  stroke(255);
  fill(255);
}

/*Boolean function(double x, double y) {
  complexNumber c = new complexNumber();
  c.real = x;
  c.imaginary = y;
  if(isMandelbrotNumber(c)) {
    return true;
  }
  return false;
}*/

void draw() {
  if(scanFlag) {
    for(int i = 0; i < sampleRate; i++) {
      double x = leftX + rnd.nextDouble()*(rightX-leftX);
      double y = bottomY + rnd.nextDouble()*(topY-bottomY);
      
      complexNumber c = new complexNumber();
      c.real = x;
      c.imaginary = y;
      float val = isMandelbrotNumber(c);
      
      //if(function(x, y)) {
        set((int)(((x-leftX) / (rightX - leftX)) * width), (int)((1 - ((y - bottomY) / (topY - bottomY))) * height), color(val));
      //}
    }
  }
}

void keyPressed() {
  if(keyCode == UP) {
    background(0);
    scanFlag = false;
    for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      double x = leftX + (rightX-leftX)*(i / (double)width);
      double y = bottomY + (topY - bottomY)*(1 - j / (double)height);
      complexNumber c = new complexNumber();
    c.real = x;
    c.imaginary = y;
    float val = isMandelbrotNumber(c);
    
    //if(function(x, y)) {
      set(i, j, color(val));
    //}
    }
  }
  }
  else if (keyCode == DOWN) {
    background(0);
    for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      double x = leftX + (rightX-leftX)*(i / (double)width);
      double y = bottomY + (topY - bottomY)*(1 - j / (double)height);
      complexNumber c = new complexNumber();
    c.real = x;
    c.imaginary = y;
    float val = isMandelbrotNumber(c);
    
    //if(function(x, y)) {
      set(i, j, color(val));
    //}
    }
  }
  saveFrame("mdlbrt-######.png");
  }
}

void mouseWheel(MouseEvent event) {
  scanFlag = true;
  background(0);
  /*for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      double x = leftX + (rightX-leftX)*(i / (double)width);
      double y = bottomY + (topY - bottomY)*(1 - j / (double)height);
      complexNumber c = new complexNumber();
    c.real = x;
    c.imaginary = y;
    float val = isMandelbrotNumber(c);
    
    //if(function(x, y)) {
      set((int)(((x-leftX) / (rightX - leftX)) * width), (int)((1 - ((y - bottomY) / (topY - bottomY))) * height), color(val));
    //}
    }
  }*/
  double e = event.getCount();
  println(e);
  
  double partialX = mouseX / (double)width;
  double partialY = 1 - mouseY / (double)height;
  
  double pointX = leftX + (rightX-leftX)*partialX;
  double pointY = bottomY + (topY - bottomY)*partialY;
  
  if(e > 0) { // Zoom out
    double newLeftX = pointX - (pointX - leftX)*1.1;
    leftX = newLeftX;
    double newRightX = pointX + (rightX - pointX)*1.1;
    rightX = newRightX;
    double newTopY = pointY + (topY - pointY)*1.1;
    topY = newTopY;
    double newBottomY = pointY - (pointY - bottomY)*1.1;
    bottomY = newBottomY;
  }
  else if(e < 0) { // Zoom in
    double newLeftX = pointX - (pointX - leftX)*0.9;
    leftX = newLeftX;
    double newRightX = pointX + (rightX - pointX)*0.9;
    rightX = newRightX;
    double newTopY = pointY + (topY - pointY)*0.9;
    topY = newTopY;
    double newBottomY = pointY - (pointY - bottomY)*0.9;
    bottomY = newBottomY;
  }
}
