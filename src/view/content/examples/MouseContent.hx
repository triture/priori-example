package view.content.examples;

import priori.geom.PriGeomPoint;
import priori.event.PriTapEvent;
import motion.Actuate;
import priori.view.text.PriText;
import priori.view.PriDisplay;
import priori.event.PriMouseEvent;
import priori.view.container.PriGroup;

class MouseContent extends PriGroup {

    private var plane:PriDisplay;

    private var hlabel:PriText;
    private var hline:PriDisplay;

    private var vlabel:PriText;
    private var vline:PriDisplay;

    private var info:PriText;

    public function new() {
        super();

    }

    override private function setup():Void {


        this.info = new PriText();
        this.info.text = "Click this area";
        this.addChild(this.info);

        this.hline = new PriDisplay();
        this.hline.bgColor = 0xCCCCCC;
        this.addChild(this.hline);

        this.hlabel = new PriText();
        this.hlabel.fontSize = 8;
        this.addChild(this.hlabel);

        this.vline = new PriDisplay();
        this.vline.bgColor = 0xCCCCCC;
        this.addChild(this.vline);

        this.vlabel = new PriText();
        this.vlabel.fontSize = 8;
        this.vlabel.anchorX = 0;
        this.vlabel.anchorY = 0;
        this.vlabel.rotation = 90;
        this.addChild(this.vlabel);

        this.plane = new PriDisplay();
        this.plane.alpha = 0;
        this.addChild(this.plane);

        this.addEventListener(PriMouseEvent.MOUSE_MOVE, onMove);
        this.addEventListener(PriTapEvent.TAP, onTap);
    }

    private function onTap(e:PriMouseEvent):Void {
        var mp:PriGeomPoint = this.mousePoint;

        this.addChild(new Spot(mp.x, mp.y));
    }

    private function onMove(e:PriMouseEvent):Void {

        var mp:PriGeomPoint = this.mousePoint;

        this.hline.x = 0;
        this.hline.centerY = mp.y;

        this.hlabel.text = Std.string(mp.y);
        this.hlabel.x = 2;
        this.hlabel.y = this.hline.y + 2;
        if (this.hlabel.maxY > this.height) this.hlabel.maxY = this.hline.y - 2;

        this.vline.centerX = mp.x;
        this.vline.y = 0;

        this.vlabel.text = Std.string(mp.x);
        this.vlabel.x = this.vline.x + this.vlabel.width + 2;
        this.vlabel.y = 2;

        if (this.vlabel.x + this.vlabel.width > this.width) this.vlabel.x = this.vline.x - 2;
    }

    override private function paint():Void {
        this.hline.width = this.width;
        this.hline.height = 1;

        this.vline.width = 1;
        this.vline.height = this.height;

        this.plane.width = this.width;
        this.plane.height = this.height;

        this.info.centerX = this.width/2;
        this.info.centerY = this.height/2;
    }
}

private class Spot extends PriDisplay {

    private var cx:Float;
    private var cy:Float;

    public function new(x:Float, y:Float) {
        super();

        this.cx = x;
        this.cy = y;

        this.bgColor = 0xFFFF00;
        this.alpha = 0.35;
        this.height = 10;
        this.width = 10;
        this.corners = [50];

        Actuate.tween(this, 0.6, {
            width : 50,
            height : 50
        }).onUpdate(function():Void {
            this.centerX = this.cx;
            this.centerY = this.cy;
        });

    }


}