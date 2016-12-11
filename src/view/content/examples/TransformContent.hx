package view.content.examples;

import priori.style.shadow.PriShadowPresets;
import motion.Actuate;
import priori.event.PriMouseEvent;
import view.content.examples.transform.TransItemBlock;
import priori.view.container.PriGroup;

class TransformContent extends PriGroup {

    private var b1:TransItemBlock;
    private var b2:TransItemBlock;
    private var b3:TransItemBlock;

    public function new() {
        super();
    }

    override private function setup():Void {
        this.b1 = new TransItemBlock("1", Std.int(0xFFFFFF * Math.random()));
        this.b1.addEventListener(PriMouseEvent.MOUSE_OVER, onOver);
        this.b1.addEventListener(PriMouseEvent.MOUSE_OUT, onOut);
        this.b1.shadow = PriShadowPresets.APPLE_SHADOW;
        this.addChild(this.b1);

        this.b2 = new TransItemBlock("2", Std.int(0xFFFFFF * Math.random()));
        this.b2.addEventListener(PriMouseEvent.MOUSE_OVER, onOver);
        this.b2.addEventListener(PriMouseEvent.MOUSE_OUT, onOut);
        this.b2.shadow = PriShadowPresets.PAPER_SHADOW;
        this.addChild(this.b2);

        this.b3 = new TransItemBlock("3", Std.int(0xFFFFFF * Math.random()));
        this.b3.addEventListener(PriMouseEvent.MOUSE_OVER, onOver);
        this.b3.addEventListener(PriMouseEvent.MOUSE_OUT, onOut);
        this.b3.shadow = PriShadowPresets.SLIM_SHADOW;
        this.addChild(this.b3);
    }

    private function onOver(e:PriMouseEvent):Void {
        if (e.currentTarget == this.b1) {
            Actuate.tween(e.currentTarget, 0.6, {
                scaleX : 1.5,
                scaleY : 1.5
            });
        } else if (e.currentTarget == this.b2) {
            Actuate.tween(e.currentTarget, 0.6, {
                rotation : 90
            });
        } else if (e.currentTarget == this.b3) {
            Actuate.tween(e.currentTarget, 0.6, {
                rotation : 180,
                scaleX : 1.5,
                scaleY : 1.5
            });
        }
    }

    private function onOut(e:PriMouseEvent):Void {
        Actuate.tween(e.currentTarget, 0.6, {
            rotation : 0,
            scaleX : 1,
            scaleY : 1
        });
    }

    override private function paint():Void {
        this.b1.centerX = this.width/4;
        this.b1.centerY = this.height/2;

        this.b2.centerX = this.width/4 * 2;
        this.b2.centerY = this.height/2;

        this.b3.centerX = this.width/4 * 3;
        this.b3.centerY = this.height/2;
    }
}
