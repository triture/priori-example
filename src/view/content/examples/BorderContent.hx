package view.content.examples;

import priori.style.border.PriBorderType;
import priori.style.border.PriBorderStyle;
import priori.view.PriDisplay;
import priori.view.container.PriContainer;
import priori.view.container.PriGroup;

class BorderContent extends PriGroup {

    private var reference:PriDisplay;
    private var container1:PriContainer;
    private var container2:PriContainer;
    private var container3:PriContainer;

    private var box1:PriDisplay;
    private var box2:PriDisplay;


    public function new() {
        super();
    }

    override private function setup():Void {
        this.reference = new PriDisplay();
        this.reference.bgColor = 0x666666;
        this.addChild(this.reference);

        this.container1 = new PriContainer();
        this.container1.bgColor = 0xFFFFFF;
        this.container1.border = new PriBorderStyle(3, 0x000000);
        this.container1.corners = [0, 0, 0, 15];
        this.addChild(this.container1);

        this.container2 = new PriContainer();
        this.container2.bgColor = 0x00dddd;
        this.container1.addChild(this.container2);

        this.container3 = new PriContainer();
        this.container3.bgColor = 0x00dddd;
        this.container3.border = new PriBorderStyle(3, 0xFF0000, PriBorderType.DASHED);
        this.container1.addChild(this.container3);


        this.box1 = new PriDisplay();
        this.box1.border = new PriBorderStyle(3, 0x000000, PriBorderType.DASHED);
        this.box1.corners = [5];
        this.addChild(this.box1);

        this.box2 = new PriDisplay();
        this.box2.border = new PriBorderStyle(3, 0x000000, PriBorderType.DOTTED);
        this.box2.corners = [5];
        this.addChild(this.box2);
    }

    override private function paint():Void {

        this.reference.width = 260;
        this.reference.height = 260;
        this.reference.centerX = this.width/2;
        this.reference.centerY = this.height/2;

        this.container1.width = 250;
        this.container1.height = 250;
        this.container1.centerX = this.width/2;
        this.container1.centerY = this.height/2;

        this.container2.x = 0;
        this.container2.y = 0;
        this.container2.width = 30;
        this.container2.height = 30;

        this.container3.width = 30;
        this.container3.height = 30;
        this.container3.maxX = this.container1.width;
        this.container3.maxY = this.container1.height;

        this.box1.centerY = this.height/2;
        this.box1.x = 100;

        this.box2.centerY = this.height/2;
        this.box2.maxX = this.width - 100;
    }
}
