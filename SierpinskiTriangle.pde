float t = 0;
int s = 800;
public void setup()
{
	size(1366, 968);
	frameRate(60);
}
public void draw()
{
	background(250);
	noFill();
	arc(width/2, 533, 1066, 1066, -HALF_PI, -HALF_PI+t);
	sierpinski(width/2, 0, 800, s);
	if(t<TWO_PI) {
		t+=0.1;
		if(s>1)s*=0.95;
	}
}
void mouseWheel(MouseEvent e){
	if(e.getCount()==-1 && s>1) s*=0.5;
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