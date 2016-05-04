package view.content.examples;

import priori.view.PriDisplay;
import priori.view.layout.PriLayoutAlignType;
import priori.view.layout.PriGridLayout;
import priori.view.layout.PriHorizontalLayout;
import priori.view.layout.PriVerticalLayout;
import priori.view.container.PriScrollableContainer;
import priori.view.container.PriGroup;

class ContainerContent extends PriGroup {

    private var verticalScroller:PriScrollableContainer;
    private var horizontalScroller:PriScrollableContainer;
    private var gridScroller:PriScrollableContainer;

    private var verticalLayout:PriVerticalLayout;
    private var horizontalLayout:PriHorizontalLayout;
    private var gridLayout:PriGridLayout;


    public function new() {
        super();
    }

    override private function setup():Void {
        this.verticalScroller = new PriScrollableContainer();
        this.verticalScroller.bgColor = 0xAAAAAA;
        this.verticalScroller.scrollerX = false;
        this.verticalScroller.scrollerY = true;
        this.addChild(this.verticalScroller);

        this.verticalLayout = new PriVerticalLayout();
        this.verticalLayout.alignType = PriLayoutAlignType.CENTER;
        this.verticalScroller.addChild(this.verticalLayout);

        for (i in 0...30) {
            var box:PriDisplay = new PriDisplay();
            box.width = 50 + 120 * Math.random();
            box.height = 100;
            box.bgColor = Math.floor(0xFFFFFF * Math.random());

            this.verticalLayout.addChild(box);
        }



        this.horizontalScroller = new PriScrollableContainer();
        this.horizontalScroller.bgColor = 0xAAAAAA;
        this.horizontalScroller.scrollerX = true;
        this.horizontalScroller.scrollerY = false;
        this.addChild(this.horizontalScroller);

        this.horizontalLayout = new PriHorizontalLayout();
        this.horizontalLayout.alignType = PriLayoutAlignType.CENTER;
        this.horizontalScroller.addChild(this.horizontalLayout);

        for (i in 0...30) {
            var box:PriDisplay = new PriDisplay();
            box.width = 100;
            box.height = 50 + 120 * Math.random();
            box.bgColor = Math.floor(0xFFFFFF * Math.random());

            this.horizontalLayout.addChild(box);
        }




        this.gridScroller = new PriScrollableContainer();
        this.gridScroller.bgColor = 0xAAAAAA;
        this.gridScroller.scrollerX = false;
        this.gridScroller.scrollerY = true;
        this.addChild(this.gridScroller);

        this.gridLayout = new PriGridLayout();
        this.gridScroller.addChild(this.gridLayout);

        for (i in 0...50) {
            var box:PriDisplay = new PriDisplay();
            box.width = 50 + 120 * Math.random();
            box.height = 50 + 120 * Math.random();
            box.bgColor = Math.floor(0xFFFFFF * Math.random());

            this.gridLayout.addChild(box);
        }
    }

    override private function paint():Void {
        var space:Float = 20;

        this.verticalScroller.x = space;
        this.verticalScroller.y = space;
        this.verticalScroller.width = (this.width - space * 3) / 2;
        this.verticalScroller.height = (this.height - space * 3) / 2;

        this.verticalLayout.width = this.verticalScroller.width;



        this.horizontalScroller.x = this.verticalScroller.maxX + space;
        this.horizontalScroller.y = space;
        this.horizontalScroller.width = (this.width - space * 3) / 2;
        this.horizontalScroller.height = (this.height - space * 3) / 2;

        this.horizontalLayout.height = this.horizontalScroller.height;


        this.gridScroller.x = space;
        this.gridScroller.y = verticalScroller.maxY + space;
        this.gridScroller.width = this.width - space * 2;
        this.gridScroller.height = (this.height - space * 3) / 2;

        this.gridLayout.width = this.gridScroller.width;
    }

}
