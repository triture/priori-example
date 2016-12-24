package view.content.examples;

import priori.view.text.PriText;
import priori.view.PriDisplay;
import priori.view.container.PriGroup;

class PerformanceTest extends PriGroup {

    public function new() {
        super();
    }

    override private function setup():Void {

        var totalItens:Int = 10000;

        var t:PriText = new PriText();
        t.text = "Please wait...";
        t.x = 10;
        this.addChild(t);

        haxe.Timer.delay(
            function():Void {
                var timeStart:Float = Date.now().getTime();

                var l:Array<PriDisplay> = [];

                for (i in 0 ... totalItens) {

                    var item:PriDisplay = new PriDisplay();
                    item.x = this.width*Math.random();
                    item.y = 30 + this.height*Math.random();
                    item.width = 100*Math.random();
                    item.height = 100*Math.random();
                    item.bgColor = Std.int(0xFFFFFF * Math.random());
                    l.push(item);
                }

                for (i in 0 ... l.length) {
                    this.addChild(l[i]);
                }

                t.text = 'Creating $totalItens PriDisplay elements in ${Std.string(Date.now().getTime() - timeStart)}ms';
            },

            200
        );
    }

}
