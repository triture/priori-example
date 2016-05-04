package components.menu;

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

    public function new() {
        super();
    }

    override private function setup():Void {
        this.bgColor = 0x19385F;

        this.btList = [];
        this.btList.push(new MenuButton(PriFaIconType.CUBE, "Priori Basics", BasicContent));
        this.btList.push(new MenuButton(PriFaIconType.OBJECT_GROUP, "Scrollers and Layouts", ContainerContent));
        this.btList.push(new MenuButton(PriFaIconType.FONT, "Text", TextContent));
        this.btList.push(new MenuButton(PriFaIconType.BOLD, "Bootstrap Components", BootstrapContent));
        this.btList.push(new MenuButton(PriFaIconType.BAN, "Cascating Disable", DisableContent));
        this.btList.push(new MenuButton(PriFaIconType.TABLE, "Datagrid", DatagridContent));

        this.addChildList(this.btList);

        // open first button
        this.btList[0].openContent();
    }

    override private function paint():Void {
        var i:Int = 0;
        var n:Int = this.btList.length;

        while (i < n) {
            this.btList[i].width = this.width;
            this.btList[i].height = 60;
            this.btList[i].x = 0;
            this.btList[i].y = i * 60;

            i++;
        }
    }
}
