/*
 * The Cubism class is the most complex 
 * filter, and contains just the one 
 * method. I created an array of numbers
 * to mirror the canvas dimensions, and
 * randomly assigned numbers between 0 and
 * 6 to each slot. This allowed me to switch
 * between 6 randomly-varied shapes via a 
 * switch statement as I iterated through
 * the pixel array. 
 */

class Cubism {
	
	// GLOBAL VARIABLES
	int randomIter1, randomIter2, randomVar1, randomVar2, randomVar3, randomVar4, randomVar5;
	int[] numbers;
	color randomBG;
	Boolean cubismActive;

	// CONSTRUCTOR
	Cubism() {
		cubismActive = false;
		numbers = new int[(width * height)];
		for (int i = 0; i < numbers.length; i += 1) {
			numbers[i] = (int)random(0, 6);
		}
	}

	// METHODS
	public void createCubism(PImage pic) { 
		randomIter1 = int(random(90, 110));
		randomIter2 = int(random(90, 110));
		randomVar1 = int(random(40, 80));
		randomVar2 = int(random(40, 80));
		randomVar3 = int(random(40, 80));
		randomVar4 = int(random(40, 80));
		randomVar5 = int(random(40, 80));
		
		for (int i = 0; i < width; i += randomIter1) {
			for (int j = 0; j < height; j += randomIter2) {
				color pixel = pic.get(i, j);
				fill(pixel);
				stroke(0);

				if ((i * j) < numbers.length) {
					int randomShape = numbers[i * j];
					
					switch(randomShape) {
					case 0:
						strokeWeight(random(1, 8));
						triangle(i - randomVar1, j + randomVar1, 
							i + randomVar1 * 2, j - randomVar1 * 2, 
							i + randomVar2 * 2, j + randomVar4);
						break;
					case 1:
						strokeWeight(random(1, 8));
						ellipse(i, j, randomVar1, 40 + randomVar2);
						break;
					case 2:
						strokeWeight(random(1, 8));
						rect(i, j, randomVar4, randomVar5);
						break;
					case 3:
						strokeWeight(random(1, 8));
						ellipse(i, j, 40 + randomVar3, randomVar4);
						break;
					case 4:
						strokeWeight(random(1, 8));
						rect(i, j, 40 + randomVar1, 40 + randomVar3);
						break;
					case 5:
						strokeWeight(random(1, 8));
						triangle(i - randomVar4, j + randomVar5, 
							i, j - randomVar3, 
							i + randomVar5, j + randomVar1);
					}
				}
			}
		}
	}
}