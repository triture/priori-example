package view.content;

import priori.view.PriDisplay;
import priori.view.text.PriText;
import components.content.ContentManager;
import components.menu.Menu;
import priori.scene.view.PriScene;

class PerformanceScene extends PriScene {

    private var menu:Menu;
    private var content:ContentManager;

    public function new() {
        super();
    }

    override private function setup():Void {

        var t:PriText = new PriText();
        t.x = 300;
        this.addChild(t);

        var timeStart:Float = Date.now().getTime();

        var l:Array<PriDisplay> = [];
        var total:Int = 10000;

        for (i in 0 ... total) {

            var item:PriDisplay = new PriDisplay();
            item.x = i*2;
            item.y = 30 + i;
            item.width = 100*Math.random();
            item.height = 100*Math.random();
            item.bgColor = Std.int(0xFFFFFF * Math.random());

            l.push(item);
        }

        this.addChildList(l);

        t.text = "t5 : " + total + " itens - " + Std.string(Date.now().getTime() - timeStart);

    }
}
