package view.content.examples;

import view.content.examples.bootstrap.OtherComponents;
import view.content.examples.bootstrap.ComponentStyles;
import view.content.examples.bootstrap.FormElements;
import priori.bootstrap.container.PriBSTabPanel;
import priori.view.container.PriGroup;

class BootstrapContent extends PriGroup {

    private var panel:PriBSTabPanel;

    public function new() {
        super();
    }

    override private function setup():Void {
        this.panel = new PriBSTabPanel();
        this.panel.justified = false;
        this.panel.addTab("Form Elements", FormElements);
        this.panel.addTab("Component Styles", ComponentStyles);
        this.panel.addTab("Other Components", OtherComponents);
        this.addChild(this.panel);
    }

    override private function paint():Void {
        var space:Int = 20;

        this.panel.x = space;
        this.panel.y = space;
        this.panel.width = this.width - space*2;
        this.panel.height = this.height - space*2;
    }
}
