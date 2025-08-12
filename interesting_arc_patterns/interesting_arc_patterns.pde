float r = 2;
int divisor = 3;
int angleDiff = 5;

float[] divisors = {360/2, 360/3, 360/6, 360/12, 360/18, 360/24, 360/30, 360/36, 360/42, 360/48, 360/54, 360/60};

PVector anchor;

void setup() {
  fullScreen();
  
  anchor = new PVector(width/2, height/2);
}

void mousePressed() {
  r = floor(random(1, 101));
  divisor = int(divisors[floor(random(0, 1) * divisors.length)]);
  angleDiff = int(random(0, 210));
}

void draw() {
  background(128);
  
  fill(0);
  textSize(24);
  text("r=" + r + "; divisor=" + divisor + "; angleDiff=" + angleDiff, 30, 30);
  
  strokeWeight(5);
  stroke(255);
  noFill();
   
  point(anchor.x, anchor.y);
  
  noFill();
  for (int i = 0; i < 360; i++) {
    if (i % divisor == 0) {
      stroke(255);
      arc(anchor.x+10, anchor.y+10, anchor.x + r * cos(radians(i)), anchor.y + r * sin(radians(i)), radians(i-angleDiff), radians(i));
      stroke(0, 128);
      // not using radians for start/stop here:
      arc(anchor.x, anchor.y, anchor.x + r * cos(radians(i)), anchor.y + r * sin(radians(i)), i-angleDiff, i);
    }
  }
}
