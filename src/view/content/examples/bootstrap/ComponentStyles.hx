package view.content.examples.bootstrap;

import priori.bootstrap.type.PriBSSize;
import priori.bootstrap.type.PriBSContextualType;
import priori.view.layout.PriVerticalLayout;
import priori.bootstrap.PriBSFormButton;
import priori.view.container.PriGroup;

class ComponentStyles extends PriGroup {

    private var layoutContext:PriVerticalLayout;
    private var layoutSize:PriVerticalLayout;

    private var button_DEFAULT:PriBSFormButton;
    private var button_PRIMARY:PriBSFormButton;
    private var button_SUCCESS:PriBSFormButton;
    private var button_INFO:PriBSFormButton;
    private var button_WARNING:PriBSFormButton;
    private var button_DANGER:PriBSFormButton;
    private var button_LINK:PriBSFormButton;

    private var button_NORMAL:PriBSFormButton;
    private var button_LARGE:PriBSFormButton;
    private var button_SMALL:PriBSFormButton;
    private var button_EXTRA_SMALL:PriBSFormButton;

    public function new() {
        super();
    }

    override private function setup():Void {
        this.layoutContext = new PriVerticalLayout();
        this.layoutContext.autoSizeElements = true;
        this.layoutContext.autoSizeContainer = false;
        this.addChild(this.layoutContext);

        this.button_DEFAULT = new PriBSFormButton();
        this.button_DEFAULT.text = "DEFAULT";
        this.button_DEFAULT.context = PriBSContextualType.DEFAULT;
        this.layoutContext.addChild(this.button_DEFAULT);

        this.button_PRIMARY = new PriBSFormButton();
        this.button_PRIMARY.text = "PRIMARY";
        this.button_PRIMARY.context = PriBSContextualType.PRIMARY;
        this.layoutContext.addChild(this.button_PRIMARY);

        this.button_SUCCESS = new PriBSFormButton();
        this.button_SUCCESS.text = "SUCCESS";
        this.button_SUCCESS.context = PriBSContextualType.SUCCESS;
        this.layoutContext.addChild(this.button_SUCCESS);

        this.button_INFO = new PriBSFormButton();
        this.button_INFO.text = "INFO";
        this.button_INFO.context = PriBSContextualType.INFO;
        this.layoutContext.addChild(this.button_INFO);

        this.button_WARNING = new PriBSFormButton();
        this.button_WARNING.text = "WARNING";
        this.button_WARNING.context = PriBSContextualType.WARNING;
        this.layoutContext.addChild(this.button_WARNING);

        this.button_DANGER = new PriBSFormButton();
        this.button_DANGER.text = "DANGER";
        this.button_DANGER.context = PriBSContextualType.DANGER;
        this.layoutContext.addChild(this.button_DANGER);

        this.button_LINK = new PriBSFormButton();
        this.button_LINK.text = "LINK";
        this.button_LINK.context = PriBSContextualType.LINK;
        this.layoutContext.addChild(this.button_LINK);



        this.layoutSize = new PriVerticalLayout();
        this.layoutSize.autoSizeElements = true;
        this.layoutSize.autoSizeContainer = false;
        this.addChild(this.layoutSize);

        this.button_LARGE = new PriBSFormButton();
        this.button_LARGE.text = "LARGE";
        this.button_LARGE.size = PriBSSize.LARGE;
        this.layoutSize.addChild(this.button_LARGE);

        this.button_NORMAL = new PriBSFormButton();
        this.button_NORMAL.text = "NORMAL";
        this.button_NORMAL.size = PriBSSize.NORMAL;
        this.layoutSize.addChild(this.button_NORMAL);

        this.button_SMALL = new PriBSFormButton();
        this.button_SMALL.text = "SMALL";
        this.button_SMALL.size = PriBSSize.SMALL;
        this.layoutSize.addChild(this.button_SMALL);

        this.button_EXTRA_SMALL = new PriBSFormButton();
        this.button_EXTRA_SMALL.text = "EXTRA_SMALL";
        this.button_EXTRA_SMALL.size = PriBSSize.EXTRA_SMALL;
        this.layoutSize.addChild(this.button_EXTRA_SMALL);

    }

    override private function paint():Void {
        var space:Int = 20;

        this.layoutContext.x = space;
        this.layoutContext.y = space;
        this.layoutContext.width = (this.width - space*3)/2;
        this.layoutContext.height = this.height - space*2;

        this.layoutSize.x = this.layoutContext.maxX + space;
        this.layoutSize.y = space;
        this.layoutSize.width = (this.width - space*3)/2;
        this.layoutSize.height = this.height - space*2;
    }
}
