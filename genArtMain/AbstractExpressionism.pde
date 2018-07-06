/* 
 *  With the AbstractExpressionism class, I attempted 
 *  to create an effect reminiscent of Jason Pollock's 
 *  work by using randomly-varied lines and beziers
 *  to create a frenzied spatter-like effect. Two methods 
 *  are available: one that applies the effect to the 
 *  entire canvas automatically, and a second which allows
 *  the user to apply the effect manually.
 */

class AbstractExpressionism {

	// GLOBAL VARIABLES
	Boolean abstExpActive;
	Boolean abstExpAutoActive;

	// CONSTRUCTOR
	AbstractExpressionism() 
	{
		abstExpActive = false;
		abstExpAutoActive = false;
	};

	// METHODS
	public void abstExpPaint(PImage pic) {  
		color pixel = pic.get(mouseX, mouseY);
		stroke(pixel, 127);
		strokeWeight(1);
		noFill();
		
		line(random(mouseX - 40, mouseX + 40), random(mouseY - 100, mouseY), 
			random(mouseX - 40, mouseX + 40), random(mouseY, mouseY + 100));

		bezier(random(mouseX - 40, mouseX + 40), random(mouseY - 100, mouseY), 
			random(mouseX - 100, mouseX + 100), random(mouseY - 100, mouseY + 100), 
			random(mouseX - 100, mouseX + 100), random(mouseY - 100, mouseY + 100), 
			random(mouseX - 40, mouseX + 40), random(mouseY, mouseY + 100));

		line(random(mouseX - 100, mouseX), random(mouseY - 60, mouseY + 60), 
			random(mouseX, mouseX + 100), random(mouseY - 60, mouseY + 60));
	}

	public void abstExpAuto(PImage pic) {
		for (int i = -20; i < width; i += 10) {
			for (int j = -20; j < height; j += 10) {
				color pixel = pic.get(i, j);
				stroke(pixel, 40);
				strokeWeight(1);
				noFill();

				line(random(i - 40, i + 40), random(j - 100, j), 
					random(i - 40, i + 40), random(j, j + 100));

				bezier(random(i - 40, i + 40), random(j - 100, j), 
					random(i - 100, i + 100), random(j - 100, j + 100), 
					random(i - 100, i + 100), random(j - 100, j + 100), 
					random(i - 40, i + 40), random(j, j + 100));

				line(random(i - 100, i), random(j - 60, j + 60), 
					random(i, i + 100), random(j - 60, j + 60));
			}
		}
	}
}