/*  
 *  Generative Art Filters App
 *  Author: David Matthew
 */

// GLOBAL VARIABLES
import processing.video.*;
import controlP5.*;
Capture cam;
ControlP5 cp5;
Boolean imageAvailable, camActive, reset;
PImage picture, storedFrame, ui;
String[] cameras;
AbstractExpressionism ae;
Cubism cub;
Impressionism im;

void setup() {
	// set up the initial canvas
	size(800, 600);
	background(0);
	picture = null;
	ui = loadImage("steel-ui.png");

	// initialize object instances
	cp5 = new ControlP5(this);
	ae = new AbstractExpressionism();
	cub = new Cubism();
	im = new Impressionism();

	// detect and set up camera
	cameras = Capture.list();
	camCheck();
	cam = new Capture(this, cameras[0]);
	cam.start();

	// initialize booleans
	imageAvailable = false;
	camActive = false;
	reset = false;
	picture = null;
	reset = false;

	// create the interface buttons
	createButtons();
}

void draw() {
	/* 
	 * The below object methods trigger depending 
	 * on the status of certain booleans.
	 * The storedFrame variable is used as the 
	 * Pimage argument for each method, and
	 * will contain either the loaded image or
	 * the current frame of the camera.
	 */

	if (imageAvailable) {
		storedFrame = picture;
		image(storedFrame, 0, 0);
	}

	if (cam.available() && camActive) {
		cam.read();
		storedFrame = cam;
		image(storedFrame, 0, 0);
	}

	if (ae.abstExpAutoActive) {
		imageAvailable = false;
		ae.abstExpAuto(storedFrame);
	}

	if (ae.abstExpActive) {
		imageAvailable = false;
		ae.abstExpPaint(storedFrame);
	}  

	if (cub.cubismActive) {
		imageAvailable = false;
		cub.createCubism(storedFrame);
	}

	if (im.imprAutoActive) {
		imageAvailable = false;
		im.impressionismAuto(storedFrame);
	}

	if (im.imprPaintActive) {
		imageAvailable = false;
		im.impressionismPaint(storedFrame);
	}

	if (reset) {
		background(0);
	}

	image(ui, 0, 0);
}

void createButtons() {
	cp5.setColorBackground(color(0));
	
	cp5.addButton("loadBtn")
		.setBroadcast(false) // prevents button from triggering automatically
		.setValue(0)
		.setPosition(50, height - 80)
		.setSize(100, 20)
		.setCaptionLabel("load  image")
		.setBroadcast(true);

	cp5.addButton("saveBtn")
		.setBroadcast(false)
		.setValue(0)
		.setPosition(50, height - 40)
		.setSize(100, 20)
		.setCaptionLabel("save  image")
		.setBroadcast(true);

	cp5.addButton("displayCam")
		.setBroadcast(false)
		.setValue(0)
		.setPosition(185, height - 80)
		.setSize(100, 20)
		.setCaptionLabel("Display Cam")
		.setBroadcast(true);

	cp5.addButton("freezeBtn")
		.setBroadcast(false)
		.setValue(0)
		.setPosition(185, height - 40)
		.setSize(100, 20)
		.setCaptionLabel("freeze/capture")
		.setBroadcast(true);

	cp5.addButton("resetBtn")
		.setBroadcast(false)
		.setValue(0)
		.setPosition(320, height - 80)
		.setSize(70, 20)
		.setCaptionLabel("reset")
		.setBroadcast(true);
	
	cp5.addButton("cubismBtn")
		.setBroadcast(false)
		.setValue(0)
		.setPosition(320, height - 40)
		.setSize(70, 20)
		.setCaptionLabel("cubism")
		.setBroadcast(true);

	cp5.addButton("abstExpBtn")
		.setBroadcast(false)
		.setValue(0)
		.setPosition(425, height - 40)
		.setSize(155, 20)
		.setCaptionLabel("abst  expressionism  (manual)")
		.setBroadcast(true);

	cp5.addButton("abstExpAutoBtn")
		.setBroadcast(false)
		.setValue(0)
		.setPosition(425, height - 80)
		.setSize(155, 20)
		.setCaptionLabel("abst  expressionism  (auto)")
		.setBroadcast(true);

	cp5.addButton("imprAutoBtn")
		.setBroadcast(false)
		.setValue(0)
		.setPosition(615, height - 80)
		.setSize(135, 20)
		.setCaptionLabel("impressionism  (auto)")
		.setBroadcast(true);

	cp5.addButton("imprPaintBtn")
		.setBroadcast(false)
		.setValue(0)
		.setPosition(615, height - 40)
		.setSize(135, 20)
		.setCaptionLabel("impressionism  (manual)")
		.setBroadcast(true);
}

/* 
 * The below functions are associated with the 
 * above cp5 buttons, the most important of which is the 
 * freeze button. This is called by every other button
 * function, and ensures the booleans are all set
 * correctly. The save button saves a randomly-named jpg 
 * within a range of 000000.jpg to 009999.jpg.
 */

void freezeBtn() {
	ae.abstExpAutoActive = false;
	ae.abstExpActive = false;
	cub.cubismActive = false;
	im.imprAutoActive = false;
	im.imprPaintActive = false;
	camActive = false;
	reset = false;
}

public void loadBtn() {
	freezeBtn();
	selectInput("Select a file to process:", "fileSelected");
}

void saveBtn() {
	freezeBtn();
	PImage img = get(50, 85, 700, 400);
	int randomSave = int(random(0, 100000));
	img.save(nf(randomSave, 6) + ".jpg");
	println(nf(randomSave, 6) + ".jpg has been saved.");
}

void displayCam() {
	freezeBtn();
	camActive = true;
}

void resetBtn() {
	freezeBtn();
	reset = true;
}

void abstExpBtn() {
	freezeBtn();
	ae.abstExpActive = true;
}

void abstExpAutoBtn() {
	freezeBtn();
	ae.abstExpAutoActive = true;
}

void cubismBtn() {
	freezeBtn();
	cub.cubismActive = true;
}

void imprAutoBtn() {
	freezeBtn();
	im.imprAutoActive = true;
}

void imprPaintBtn() {
	freezeBtn();
	im.imprPaintActive = true;
}

// function to select and load an image
void fileSelected(File selection) {
	if (selection == null) {
		println("Window was closed or the user hit cancel.");
	} else {
		picture = loadImage(selection.getAbsolutePath());
		imageAvailable = (picture != null);
	}
}

// function to check whether there is an available camera
void camCheck() {
	if (cameras.length == 0) {
		println("There are no cameras available for capture.");
		exit();
	} else {
		println("Available cameras:");
		for (int i = 0; i < cameras.length; i += 1) {
			println(cameras[i]);
		}
	}
}
