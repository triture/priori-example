package view.content.examples;
import priori.style.shadow.PriShadowPresets;
import priori.view.PriFrame;
import priori.view.container.PriGroup;

class WebFrameContent extends PriGroup {

    private var frame:PriFrame;

    public function new() {
        super();
    }

    override private function setup():Void {

        this.frame = new PriFrame();
        this.frame.corners = [4];
        this.frame.shadow = PriShadowPresets.PAPER_SHADOW;
        this.frame.url = "http://priori.triture.com/dox";

        this.addChild(this.frame);
    }

    override private function paint():Void {

        var space:Int = 30;

        this.frame.x = space;
        this.frame.y = space;

        this.frame.width = this.width - space*2;
        this.frame.height = this.height - space*2;

    }
}
