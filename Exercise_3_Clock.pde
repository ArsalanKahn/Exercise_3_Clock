
// didnt really understand, so I used reference to learn the process from https://processing.org/examples/clock.html
int clockaxisx, clockaxisy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float FrameclockDiameter;

void setup() {
  size(640, 360);
  stroke(255);
  
  int radiusClock = min(width, height) / 2;
  secondsRadius = radiusClock * 0.72;
  minutesRadius = radiusClock * 0.60;
  hoursRadius = radiusClock * 0.50;
  FrameclockDiameter = radiusClock * 1.8;
  
  clockaxisx = width / 2;
  clockaxisy = height / 2;
}

void draw() {
  background(0);
  
  fill(80);
  noStroke();
  ellipse(clockaxisx, clockaxisy, FrameclockDiameter, FrameclockDiameter);
  
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
 strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = clockaxisx + cos(angle) * secondsRadius;
    float y = clockaxisy + sin(angle) * secondsRadius;
    vertex(x, y);
    
  stroke(255);
  strokeWeight(3);
  line(clockaxisx, clockaxisy, clockaxisx + cos(s) * secondsRadius, clockaxisy + sin(s) * secondsRadius);
  strokeWeight(2);
  line(clockaxisx, clockaxisy, clockaxisx + cos(m) * minutesRadius, clockaxisy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(clockaxisx, clockaxisy, clockaxisx + cos(h) * hoursRadius, clockaxisy + sin(h) * hoursRadius);
  }
  endShape();
}
