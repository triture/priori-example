package view.content.examples;

import priori.style.font.PriFontStyle;
import priori.view.text.PriText;
import priori.view.PriImage;
import priori.view.PriNineSlice;
import priori.view.container.PriGroup;

class NineSliceContent extends PriGroup {

    private var label1:PriText;
    private var label2:PriText;

    private var image1:PriImage;
    private var image2:PriImage;

    private var nineSlice1:PriNineSlice;
    private var nineSlice2:PriNineSlice;

    public function new() {
        super();
    }

    override private function setup():Void {

        this.label1 = new PriText();
        this.label1.text = "Normal Image Scale";
        this.label1.fontSize = 12;
        this.addChild(this.label1);

        this.label2 = new PriText();
        this.label2.text = "9 Sliced Scale";
        this.label2.fontSize = 12;
        this.addChild(this.label2);

        this.image1 = new PriImage("nineslice_example_1");
        this.addChild(this.image1);

        this.image2 = new PriImage("nineslice_example_2");
        this.addChild(this.image2);

        this.nineSlice1 = new PriNineSlice("nineslice_example_1");
        this.nineSlice1.updateSliceCropInPixels(40, 40, 80, 20);
        this.nineSlice1.smoothSides = false;
        this.addChild(this.nineSlice1);

        this.nineSlice2 = new PriNineSlice("nineslice_example_2");
        this.addChild(this.nineSlice2);
    }

    override private function paint():Void {
        var space:Int = 20;
        var labelSpace:Int = 130;

        this.image1.width = (this.width - space * 4 - labelSpace)/2;
        this.image1.height = (this.height - space * 3)/2;
        this.image1.x = space*2 + labelSpace;
        this.image1.y = space;

        this.image2.width = (this.width - space * 4 - labelSpace)/2;
        this.image2.height = (this.height - space * 3)/2;
        this.image2.x = this.image1.maxX + space;
        this.image2.y = space;

        this.nineSlice1.width = this.image1.width;
        this.nineSlice1.height = this.image1.height;
        this.nineSlice1.x = this.image1.x;
        this.nineSlice1.y = this.image1.maxY + space;

        this.nineSlice2.width = this.image2.width;
        this.nineSlice2.height = this.image2.height;
        this.nineSlice2.x = this.image2.x;
        this.nineSlice2.y = this.image2.maxY + space;


        this.label1.maxX = labelSpace + space;
        this.label1.centerY = this.image1.centerY;

        this.label2.maxX = labelSpace + space;
        this.label2.centerY = this.nineSlice1.centerY;
    }
}
