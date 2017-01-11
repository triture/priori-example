package view.content.examples;

import priori.geom.PriGeomBox;
import priori.app.PriApp;
import priori.event.PriTapEvent;
import priori.style.font.PriFontStyleAlign;
import priori.style.font.PriFontStyle;
import priori.view.PriImage;
import priori.view.text.PriText;
import priori.view.PriDisplay;
import priori.view.container.PriGroup;

class BasicContent extends PriGroup {

    private var quad1:PriDisplay;
    private var quad2:PriDisplay;
    private var quad3:PriDisplay;
    private var quad4:PriDisplay;
    private var preloadedImage:PriImage;

    private var label1:PriText;
    private var label2:PriText;
    private var label3:PriText;
    private var label4:PriText;
    private var label5:PriText;

    public function new() {
        super();
    }

    override private function setup():Void {

        this.quad1 = new PriDisplay();
        this.addChild(this.quad1);

        this.quad2 = new PriDisplay();
        this.quad2.corners = [5];
        this.addChild(this.quad2);

        this.quad3 = new PriDisplay();
        this.quad3.corners = [5, 10];
        this.addChild(this.quad3);

        this.quad4 = new PriDisplay();
        this.quad4.corners = [5, 10, 15];
        this.addChild(this.quad4);

        this.preloadedImage = new PriImage("image_example");
        this.preloadedImage.addEventListener(PriTapEvent.TAP_DOWN, onTapDown);
        this.preloadedImage.corners = [5, 10, 15, 20];
        this.addChild(this.preloadedImage);

        this.quad1.bgColor = this.quad2.bgColor = this.quad3.bgColor = this.quad4.bgColor = Math.floor(Math.random() * 0xFFFFFF);

        this.label1 = new PriText();
        this.label1.text = "Quad 1";
        this.addChild(this.label1);

        this.label2 = new PriText();
        this.label2.text = "Quad 2";
        this.addChild(this.label2);

        this.label3 = new PriText();
        this.label3.text = "Quad 3";
        this.addChild(this.label3);

        this.label4 = new PriText();
        this.label4.text = "Quad 4";
        this.addChild(this.label4);

        this.label5 = new PriText();
        this.label5.html = "Drag this image";
        this.label5.fontStyle = new PriFontStyle(PriFontStyleAlign.CENTER);
        this.addChild(this.label5);
    }

    override private function paint():Void {
        var margin:Int = 20;

        this.quad1.x = margin;
        this.quad1.y = margin;

        this.quad2.maxX = this.width - margin;
        this.quad2.y = margin;

        this.quad3.x = margin;
        this.quad3.maxY = this.height - margin;

        this.quad4.maxX = this.width - margin;
        this.quad4.maxY = this.height - margin;


        this.preloadedImage.width = this.width * 0.3;
        this.preloadedImage.imageScaleY = this.preloadedImage.imageScaleX;
        this.preloadedImage.centerX = this.width / 2;
        this.preloadedImage.centerY = this.height / 2;



        this.label1.x = this.quad1.maxX + margin;
        this.label1.centerY = this.quad1.centerY;

        this.label2.maxX = this.quad2.x - margin;
        this.label2.centerY = this.quad2.centerY;

        this.label3.centerX = this.quad3.centerX;
        this.label3.maxY = this.quad3.y - margin;

        this.label4.centerX = this.quad4.centerX;
        this.label4.maxY = this.quad4.y - margin;

        this.label5.centerX = this.preloadedImage.centerX;
        this.label5.centerY = this.preloadedImage.maxY + margin;
    }

    private function onTapDown(e:PriTapEvent):Void {
        this.preloadedImage.removeEventListener(PriTapEvent.TAP_DOWN, this.onTapDown);
        PriApp.g().addEventListener(PriTapEvent.TAP_UP, this.onTapUp);

        this.preloadedImage.startDrag(true, new PriGeomBox(0, 0, this.width - this.preloadedImage.width, this.height - this.preloadedImage.height));
    }

    private function onTapUp(e:PriTapEvent):Void {
        PriApp.g().removeEventListener(PriTapEvent.TAP_UP, this.onTapUp);
        this.preloadedImage.addEventListener(PriTapEvent.TAP_DOWN, this.onTapDown);

        this.preloadedImage.stopDrag();
    }

}
