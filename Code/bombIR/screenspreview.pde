// Displays a thumbnail preview of the camera

class ScreenPreview {
	
	boolean isVisible = false;
	GSCapture screenImage;

	int width;
	int height;
        
        // Values to show cropping
        float height_16_9;
        float offsetY_16_9;

	ScreenPreview( int w, int h ) {
		this.width   = w;
		this.height  = h;
                height_16_9  = this.height * 0.75;
                offsetY_16_9 = ( this.height - height_16_9 ) / 2;
	}

	void setScreen(GSCapture scrImg) {
		screenImage = scrImg;
	}

	boolean isVisible() {
           return this.isVisible;
	}

	void show() {

		if(this.isVisible == false){
			this.isVisible = true;
		}
		else {
			println("ScreenPreview.show() error: screen is already visible");
		}
	}

	void hide() {

		if(this.isVisible == true){
	             this.isVisible = false;
		}
		else {
			println("ScreenPreview.show() error: screen is already hidden");
		}
	}
        
        // Show the image in a small frame
	void draw() {
		if(null != screenImage) {
			image(screenImage, 0,0, this.width, this.height);
                        pushStyle();
                        noFill();
                        stroke(10,200,50);
                        rect( 0, 0,            this.width, this.height ); // frame 4:3
                        rect( 0, offsetY_16_9, this.width, height_16_9 ); // frame 16:9
                        popStyle();
		}
		else {
			println("ERROR: ScreenPreview.draw() doesn't have an image to display");
		}
	}

}

