package view.content;

import priori.view.text.PriText;
import priori.view.PriDisplay;
import components.content.ContentManager;
import components.menu.Menu;
import priori.scene.view.PriScene;

class ContentScene extends PriScene {

    private var menu:Menu;
    private var content:ContentManager;

    public function new() {
        super();
    }

    override private function setup():Void {
//
//        var t:PriText = new PriText();
//        this.addChild(t);
//
//        var timeStart:Float = Date.now().getTime();
//
//        for (i in 0 ... 10000) {
//
//            var item:PriDisplay = new PriDisplay();
//            item.x = i*2;
//            item.y = 30 + i;
//            item.bgColor = Std.int(0xFFFFFF * Math.random());
//            this.addChild(item);
//
//        }
//
//
//        t.text = "t3 : " + Std.string(Date.now().getTime() - timeStart);

        this.menu = new Menu();
        this.addChild(this.menu);

        this.content = ContentManager.global();
        this.addChild(this.content);
    }

    override private function paint():Void {
        this.menu.x = 0;
        this.menu.y = 0;
        this.menu.width = 250;
        this.menu.height = this.height;

        this.content.x = 250;
        this.content.y = 0;
        this.content.width = this.width - 250;
        this.content.height = this.height;
    }
}
