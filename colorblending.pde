// define a list of colors to blend between
color[] colors = {
  color(255, 0, 24),
  color(255, 165, 44),
  color(255, 255, 65),
  color(0, 128, 24),
  color(0, 0, 249),
  color(134, 0, 125)
};

// configure layout
int spectrumheight = 100;
int left = 20;

// computed layout properties
int top;
int pixelcount;
int pixelsperblend;

void setup() {
  size(600, 400);
  
  // calculate the pixel amount of width the spectrum can use
  pixelcount = width - 2 * left;
  // calculate the top position of the spectrum
  top = height / 2 - spectrumheight / 2;
  
  // how many pixels we can give each color
  pixelsperblend = pixelcount / (colors.length - 1);
  
  noStroke(); 
}

void draw() {
  background(0);
  
  for (int c = 0; c < colors.length - 1; c++) {
    color colorA = colors[c];
    color colorB = colors[c+1];
    
    pushMatrix();
    // translate by current color index
    translate(left + pixelsperblend * c, top);

    for (int p = 0; p < pixelsperblend; p++) {
      // calculate the percentage of progess between colorA and colorB for this column
      float progress = (float)p / (float)pixelsperblend;
      
      // lerp between colorA and ColorB by progress
      fill(lerpColor(colorA, colorB, progress));
      
      // draw a single column with this color
      rect(p, 0, 1, spectrumheight); //<>//
    }
    
    popMatrix();
  }
}
