package components.menu;

import components.content.ContentManager;
import priori.event.PriTapEvent;
import motion.Actuate;
import priori.event.PriMouseEvent;
import priori.style.font.PriFontStyle;
import priori.view.PriDisplay;
import priori.view.text.PriText;
import priori.fontawesome.PriFAIcon;
import priori.view.container.PriGroup;

class MenuButton extends PriGroup {

    private var _ico:String;
    private var _label:String;
    private var _content:Class<PriGroup>;

    private var ico:PriFAIcon;
    private var label:PriText;
    private var bg:PriDisplay;

    public function new(ico:String, label:String, content:Class<PriGroup>) {
        super();

        this._ico = ico;
        this._label = label;
        this._content = content;
    }

    public function openContent():Void {
        ContentManager.global().openContent(this._content);
    }

    override private function setup():Void {

        this.bg = new PriDisplay();
        this.bg.bgColor = 0x162E53;
        this.bg.width = 0;
        this.addChild(this.bg);

        this.ico = new PriFAIcon();
        this.ico.icon = this._ico;
        this.ico.iconColor = 0xFFFFFF;
        this.addChild(this.ico);

        this.label = new PriText();
        this.label.text = this._label;
        this.label.fontStyle = new PriFontStyle(0xFFFFFF);
        this.addChild(this.label);


        this.addEventListener(PriMouseEvent.MOUSE_OVER, onOver);
        this.addEventListener(PriMouseEvent.MOUSE_OUT, onOut);
        this.addEventListener(PriTapEvent.TAP, onTap);
    }

    private function onOver(e:PriMouseEvent):Void {
        Actuate.tween(this.bg, 0.3, {width : this.width});
    }

    private function onOut(e:PriMouseEvent):Void {
        Actuate.tween(this.bg, 0.3, {width : 0});
    }

    private function onTap(e:PriTapEvent):Void {
        this.openContent();
    }

    override private function paint():Void {
        this.ico.x = 20;
        this.ico.centerY = this.height/2;

        this.label.x = 60;
        this.label.centerY = this.height/2;

        this.bg.x = 0;
        this.bg.y = 0;
        this.bg.height = this.height;
    }
}
