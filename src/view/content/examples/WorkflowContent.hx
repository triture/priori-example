package view.content.examples;

import priori.event.PriTapEvent;
import priori.view.PriDisplay;
import priori.bootstrap.PriBSFormButton;
import priori.view.container.PriGroup;

class WorkflowContent extends PriGroup {

    // add a box when tapped to the end of list
    private var buttonAdd:PriBSFormButton;

    // remove the first box when tapped
    private var buttonRemove:PriBSFormButton;

    // box list
    private var boxList:Array<PriDisplay>;

    public function new() {
        super();
    }

    override private function setup():Void {
        this.boxList = [];

        this.buttonAdd = new PriBSFormButton();
        this.buttonAdd.text = "Add";
        this.buttonAdd.addEventListener(PriTapEvent.TAP, onAdd);
        this.addChild(this.buttonAdd);

        this.buttonRemove = new PriBSFormButton();
        this.buttonRemove.text = "Remove";
        this.buttonRemove.addEventListener(PriTapEvent.TAP, onRemove);
        this.addChild(this.buttonRemove);

        // after the setup method, paint() will be executed immediately
    }

    override private function paint():Void {
        var space:Int = 10;

        this.buttonAdd.x = space;
        this.buttonAdd.y = space;

        this.buttonRemove.x = this.buttonAdd.maxX + space;
        this.buttonRemove.y = space;


        // put all boxes side by side
        for (i in 0...this.boxList.length) {
            if (i == 0) {
                this.boxList[i].x = space;
                this.boxList[i].centerY = this.height/2;
            } else {
                this.boxList[i].x = this.boxList[i - 1].maxX + space;
                this.boxList[i].centerY = this.height/2;
            }
        }
    }

    private function onAdd(e:PriTapEvent):Void {
        var box:PriDisplay = new PriDisplay();
        box.bgColor = Math.floor(Math.random()*0xFFFFFF);

        this.boxList.push(box);

        this.addChild(box); // ---> This cause an invalidation

        this.validate(); // if you don't wanna a display flickering, call this method at the end
    }

    private function onRemove(e:PriTapEvent):Void {
        if (this.boxList.length > 0) {
            var box:PriDisplay = this.boxList.shift();

            this.removeChild(box); // ---> This cause an invalidation too

            box.kill(); // ---> this is a good pratice
            box = null; // ---> and this too.

            this.validate(); // if you don't wanna a display flickering, call this method at the end
        }
    }
}
