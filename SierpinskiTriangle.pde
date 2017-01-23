public void setup()
{
	size(600, 600);
}
public void draw()
{
	sierpinski(300, 300, 500);
}
public void mouseDragged()//optional
{ 

}
public void sierpinski(int x, int y, int len) 
{
	if(len<=20){
		beginShape();
			vertex(x, y);
		    vertex(x-len/tan(PI/3), y+len);
	    	vertex(x+len/tan(PI/3), y+len);
		endShape(CLOSE);
	}
	else{
		sierpinski(x, y, len-1);
	}	
}