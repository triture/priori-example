package components.menu;

import view.content.examples.MouseContent;
import view.content.examples.PerformanceTest;
import view.content.examples.TransformContent;
import priori.view.container.PriScrollableContainer;
import view.content.examples.NineSliceContent;
import view.content.examples.BorderContent;
import view.content.examples.WorkflowContent;
import view.content.examples.DatagridContent;
import view.content.examples.BootstrapContent;
import view.content.examples.DisableContent;
import view.content.examples.TextContent;
import view.content.examples.ContainerContent;
import view.content.examples.BasicContent;
import priori.fontawesome.PriFaIconType;
import priori.view.container.PriGroup;

class Menu extends PriGroup {

    private var btList:Array<MenuButton>;
    private var scroller:PriScrollableContainer;

    public function new() {
        super();
    }

    override private function setup():Void {
        this.bgColor = 0x19385F;

        this.scroller = new PriScrollableContainer();
        this.addChild(scroller);

        this.btList = [];
        this.btList.push(new MenuButton(PriFaIconType.CUBE, "Priori Basics", BasicContent));
        this.btList.push(new MenuButton(PriFaIconType.EXCHANGE, "PriGroup Workflow", WorkflowContent));
        this.btList.push(new MenuButton(PriFaIconType.OBJECT_GROUP, "Scrollers and Layouts", ContainerContent));
        this.btList.push(new MenuButton(PriFaIconType.FONT, "Text", TextContent));
        this.btList.push(new MenuButton(PriFaIconType.BOLD, "Bootstrap Components", BootstrapContent));
        this.btList.push(new MenuButton(PriFaIconType.BAN, "Cascating Disable", DisableContent));
        this.btList.push(new MenuButton(PriFaIconType.TABLE, "Datagrid", DatagridContent));
        this.btList.push(new MenuButton(PriFaIconType.SQUARE_O, "Border Examples", BorderContent));
        this.btList.push(new MenuButton(PriFaIconType.TH, "Nine-Slice Examples", NineSliceContent));
        this.btList.push(new MenuButton(PriFaIconType.FLASK, "Effects", TransformContent));
        this.btList.push(new MenuButton(PriFaIconType.COG, "Performance Test", PerformanceTest));
        this.btList.push(new MenuButton(PriFaIconType.MOUSE_POINTER, "Mouse", MouseContent));

        this.scroller.addChildList(this.btList);

        // open first button
        this.btList[0].openContent();
    }

    override private function paint():Void {
        var i:Int = 0;
        var n:Int = this.btList.length;

        this.scroller.width = this.width;
        this.scroller.height = this.height;

        while (i < n) {
            this.btList[i].width = this.width;
            this.btList[i].height = 40;
            this.btList[i].x = 0;
            this.btList[i].y = i * 40;

            i++;
        }
    }
}
