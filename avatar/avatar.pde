int size = 5000;

float phi = (1 + sqrt(5)) / 2; // Golden ratio

int padding = parseInt(0.25 * size);
int usize = size - 2 * padding; // Usable size

// Golden ratio cut on usize
int minorSize = parseInt(usize * (phi - 1) / phi);

// Ring of circles init radius
int ringR = parseInt(sqrt(pow(usize, 2) + pow(minorSize, 2)));

// Side circle radius
int sideR = parseInt((pow(usize, 2) + pow(minorSize, 2)) / (2 * minorSize));

void setup() {
  // Have to use numbers here
  size(5000, 5000);
  background(255);
  fill(0, 0);
  stroke(150);
  translate(padding, padding);
  
  // Padding outline
  rect(0, 0, usize, usize);

  // Rings
  int i, diff, dia;
  for (i = 0; i < 6; i++) {
    diff = parseInt((ringR - minorSize) / 5);
    dia = 2 * ringR - i * 2 * diff;
    ellipse(usize, 0, dia, dia);
  }
  
  // Side circles
  ellipse(usize - sideR, 0, 2 * sideR, 2 * sideR);
  ellipse(usize, sideR, 2 * sideR, 2 * sideR);
  
  // Save image
  save("outline.png");
}