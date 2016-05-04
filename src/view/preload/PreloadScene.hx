package view.preload;

import priori.style.font.PriFontStyleWeight;
import priori.style.font.PriFontStyle;
import priori.view.text.PriText;
import priori.scene.view.preload.PriPreloadScene;
import priori.view.PriDisplay;

class PreloadScene extends PriPreloadScene {

    private var bar:PriDisplay;
    private var barBg:PriDisplay;
    private var title:PriText;

    public function new() {
        super();
    }

    override private function setup():Void {
        this.bgColor = 0xEEEEEE;

        this.title = new PriText();
        this.title.fontStyle = new PriFontStyle();
        this.title.fontSize = 16;
        this.title.text = "Loading...";
        this.addChild(this.title);

        this.barBg = new PriDisplay();
        this.barBg.bgColor = 0xCCCCCC;
        this.addChild(this.barBg);

        this.bar = new PriDisplay();
        this.bar.width = 0;
        this.bar.bgColor = 0xAAAAAA;
        this.addChild(this.bar);
    }

    override private function paint():Void {

        this.title.centerX = this.width/2;
        this.title.maxY = this.height/2 - 10;

        this.barBg.x = 0;
        this.barBg.y = this.height/2;
        this.barBg.width = this.width;
        this.barBg.height = 15;

        this.bar.x = 0;
        this.bar.y = this.barBg.y;
        this.bar.height = 15;
    }

    override public function updateProgress(percent:Float):Void {
        if (this.bar != null) {
            this.bar.width = this.width * percent;
        }
    }

}
