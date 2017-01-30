float t = 0;
int s = 800;
int START_SIZE; 
public void setup()
{
	size(800, 800);
	frameRate(60);
  START_SIZE=(int)(0.625*height);
}
public void draw()
{
	background(250);
	noFill();
  strokeWeight(5);
  line(width*0.31, height*0.88, width*0.25, height*0.95);
  line(width*0.19, height*0.88, width*0.25, height*0.95);
  line(width*0.75, height*0.88, width*0.81, height*0.95);
  line(width*0.75, height*0.88, width*0.69, height*0.95);
  strokeWeight(1);
	arc(width/2, 8+0.666*START_SIZE, 1.333*START_SIZE, 1.333*START_SIZE, -HALF_PI, -HALF_PI+t);
	sierpinski(width/2, 8, START_SIZE, s);
	if(t<TWO_PI) {
		t+=0.1;
		if(s>1)s*=0.95;
	}
}
void mouseClicked(){
	if(mouseY>height*0.85) 
      if(mouseX>width/2)
        s*=0.5;
	else s*=2;
}
public void sierpinski(float x, float y, int len, float smallest) 
{
	if(len<=smallest){
		fill(0);
		beginShape();
			vertex(x, y);
		    vertex(x-len/tan(PI/3), y+len);
	    	vertex(x+len/tan(PI/3), y+len);
		endShape(CLOSE);
	}
	else{
		sierpinski(x+0.5*len/tan(PI/3), y+len/2, len/2, smallest);
		sierpinski(x-0.5*len/tan(PI/3), y+len/2, len/2, smallest);
		sierpinski(x, y, len/2, smallest);
	}	
}