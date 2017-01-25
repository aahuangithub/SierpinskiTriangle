float t = 0;
public void setup()
{
	size(900, 900);
	frameRate(60);
}
public void draw()
{
	line(450,0,450,450*t/TWO_PI);
	//y not changing properly
	line(450-450/tan(PI/3),450, 450+(0.5*450/tan(PI/3)*t/TWO_PI), 450-225);
	line(450+450/tan(PI/3),450, 450-0.5*450/tan(PI/3), 450/2);

	noFill();
	arc(450, 450-72*2.1, 100, 100, 0, t);
	
	if(t<TWO_PI) t+=0.1;
	else sierpinski(450, 0, 450);
}

public void sierpinski(float x, float y, int len) 
{
	if(len<=2){
		fill(0);
		beginShape();
			vertex(x, y);
		    vertex(x-len/tan(PI/3), y+len);
	    	vertex(x+len/tan(PI/3), y+len);
		endShape(CLOSE);
	}
	else{
		sierpinski(x+0.5*len/tan(PI/3), y+len/2, len/2);
		sierpinski(x-0.5*len/tan(PI/3), y+len/2, len/2);
		sierpinski(x, y, len/2);
	}	
}