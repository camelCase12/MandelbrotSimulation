int accuracy = 1000; // This variable can range from 1 to infinity, the higher it is, the more accurate, but the more demanding processing is. 1000 is near perfect on this pixel scale.

class complexNumber {
  float real;
  float imaginary;
}

void iterateFunction(int testAmount) { //Selects a coordinate from (-2, -2) to (2, 2) for testing
  complexNumber cParameter = new complexNumber();
  for(int i = 0; i < testAmount; i++) {
      cParameter.real = random(mandelbrotBound.left, mandelbrotBound.right);
      cParameter.imaginary = random(mandelbrotBound.bottom, mandelbrotBound.top);
      if(isMandelbrotNumber(cParameter)) {
        renderMandelbrot(cParameter);
      }
  }
}

Boolean isMandelbrotNumber(complexNumber c) {
  complexNumber Zn = new complexNumber();
  Zn.real = 0;
  Zn.imaginary = 0;
  complexNumber Zn1 = new complexNumber();
  Zn1.real = 0;
  Zn1.imaginary = 0;
  for(int i = 0; i < accuracy; i++) {
    Zn = square(Zn);
    Zn1 = sum(Zn, c);
    Zn = Zn1;
    if(absoluteValue(Zn) > 2.0) {
      return false;
    }
  }
  return true;
}

complexNumber square(complexNumber c) { //Examine custom object return type 
//(perhaps embed within complexNumber class?)
  complexNumber newComplexNumber = new complexNumber();
  newComplexNumber.real = (c.real)*(c.real) - (c.imaginary)*(c.imaginary);
  newComplexNumber.imaginary = 2*(c.real)*(c.imaginary);
  return newComplexNumber;
}

complexNumber sum(complexNumber c1, complexNumber c2) {
  complexNumber newComplexNumber = new complexNumber();
  newComplexNumber.real = c1.real + c2.real;
  newComplexNumber.imaginary = c1.imaginary + c2.imaginary;
  return newComplexNumber;
}

float absoluteValue(complexNumber c) {
  float absValue = sqrt((c.real)*(c.real) + (c.imaginary)*(c.imaginary));
  return absValue;
}
