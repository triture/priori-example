package view.content.examples.bootstrap;

import priori.bootstrap.PriBSNavTab;
import priori.bootstrap.type.PriBSIconType;
import priori.bootstrap.PriBSIcon;
import priori.bootstrap.type.PriBSContextualType;
import priori.bootstrap.PriBSLabel;
import priori.view.layout.PriLayoutAlignType;
import priori.bootstrap.type.PriBSImageStyle;
import priori.bootstrap.PriBSImage;
import priori.view.layout.PriVerticalLayout;
import priori.view.container.PriGroup;

class OtherComponents extends PriGroup {

    private var layout1:PriVerticalLayout;
    private var layout2:PriVerticalLayout;

    private var label:PriBSLabel;
    private var icon:PriBSIcon;
    private var image_ROUNDED:PriBSImage;
    private var image_CIRCLE:PriBSImage;
    private var image_THUMBNAIL:PriBSImage;

    private var navTabNormal:PriBSNavTab;
    private var navTabJustified:PriBSNavTab;


    public function new() {
        super();
    }

    override private function setup():Void {
        this.layout1 = new PriVerticalLayout();
        this.layout1.alignType = PriLayoutAlignType.CENTER;
        this.layout1.autoSizeContainer = false;
        this.layout1.autoSizeElements = false;
        this.addChild(this.layout1);

        this.label = new PriBSLabel();
        this.label.context = PriBSContextualType.SUCCESS;
        this.label.text = "Bootstrap Label";
        this.layout1.addChild(this.label);

        this.icon = new PriBSIcon();
        this.icon.icon = PriBSIconType.REMOVE_CIRCLE;
        this.icon.iconSize = 40;
        this.icon.iconColor = 0xFF0000;
        this.layout1.addChild(this.icon);

        this.image_ROUNDED = new PriBSImage("image_example");
        this.image_ROUNDED.width = 100;
        this.image_ROUNDED.scaleY = this.image_ROUNDED.scaleX;
        this.image_ROUNDED.imageStyle = PriBSImageStyle.ROUNDED;
        this.layout1.addChild(this.image_ROUNDED);

        this.image_CIRCLE = new PriBSImage("image_example");
        this.image_CIRCLE.width = 100;
        this.image_CIRCLE.scaleY = this.image_CIRCLE.scaleX;
        this.image_CIRCLE.imageStyle = PriBSImageStyle.CIRCLE;
        this.layout1.addChild(this.image_CIRCLE);

        this.image_THUMBNAIL = new PriBSImage("image_example");
        this.image_THUMBNAIL.width = 100;
        this.image_THUMBNAIL.scaleY = this.image_THUMBNAIL.scaleX;
        this.image_THUMBNAIL.imageStyle = PriBSImageStyle.THUMBNAIL;
        this.layout1.addChild(this.image_THUMBNAIL);



        this.layout2 = new PriVerticalLayout();
        this.layout2.alignType = PriLayoutAlignType.CENTER;
        this.layout2.autoSizeContainer = false;
        this.layout2.autoSizeElements = true;
        this.layout2.gap = 40;
        this.addChild(this.layout2);


        this.navTabNormal = new PriBSNavTab();
        this.navTabNormal.data = [
            {
                label : "Tab 1"
            },
            {
                label : "Tab 2"
            },
            {
                label : "Tab 3"
            }
        ];
        this.layout2.addChild(this.navTabNormal);


        this.navTabJustified = new PriBSNavTab();
        this.navTabJustified.justified = true;
        this.navTabJustified.data = [
            "Tab 1",
            "Tab 2",
            "Tab 3"
        ];
        this.layout2.addChild(this.navTabJustified);
    }

    override private function paint():Void {
        var space:Int = 20;

        this.layout1.x = space;
        this.layout1.y = space;
        this.layout1.width = (this.width - space*3)/2;
        this.layout1.height = this.height - space*2;

        this.layout2.x = this.layout1.maxX + space;
        this.layout2.y = space;
        this.layout2.width = (this.width - space*3)/2;
        this.layout2.height = this.height - space*2;
    }
}
