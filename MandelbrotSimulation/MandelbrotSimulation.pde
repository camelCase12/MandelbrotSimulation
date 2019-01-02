//The premise of the Mandelbrot is the set of the infinitely many complex numbers that satisfy a strange condition.
//Consider the formula z(n+1) = (z(n))^2 + c, read as: z sub n + 1 equals z sub n quantity squared plus c
//This is an iterative formula where z(n) starts as 0, and c is any selected complex number for verification.
//Verification occurs when this formula oscillates between several numbers, rather than approaching positive or negative infinity.
//If verification occurs, the complex number is a member of the Mandelbrot set.
//All members of the Mandelbrot set can be placed inside of a circle of radius 2, placed at the intersection of the complex and real axes.
zoomBound mandelbrotBound = new zoomBound();

void setup() {
 size(1001, 1001);
 background(0);
 renderAll();
}

void draw() {
  iterateFunction(5000);
}
