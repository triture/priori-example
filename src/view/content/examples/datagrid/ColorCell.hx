package view.content.examples.datagrid;

import StringTools;
import priori.view.PriDisplay;
import priori.view.grid.cell.PriGridCellRenderer;

class ColorCell extends PriGridCellRenderer {

    private var box:PriDisplay;

    public function new() {
        super();
    }

    override public function update():Void {
        if (this.box != null) {
            var colorHexString:String = StringTools.replace(this.value, "#", "0x");
            var colorNumber:Int = Std.parseInt(colorHexString);

            this.box.bgColor = colorNumber;
        }
    }

    override private function setup():Void {
        this.box = new PriDisplay();
        this.addChild(this.box);

        this.update();
    }

    override private function paint():Void {
        var space:Float = 5;

        this.box.width = this.width - space*2;
        this.box.height = this.height - space*2;

        this.box.x = space;
        this.box.y = space;

    }
}
