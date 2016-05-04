package view.content.examples.bootstrap;

import priori.view.container.PriGroup;
import priori.bootstrap.PriBSFormLabel;
import priori.bootstrap.PriBSFormSelect;
import priori.bootstrap.PriBSFormInputText;
import priori.bootstrap.PriBSFormButton;

class FormElements extends PriGroup {

    private var label:PriBSFormLabel;
    private var input:PriBSFormInputText;
    private var select:PriBSFormSelect;
    private var button:PriBSFormButton;
    private var buttonWithBadge:PriBSFormButton;

    public function new() {
        super();
    }

    override private function setup():Void {
        this.label = new PriBSFormLabel();
        this.label.text = "Form Label";
        this.addChild(this.label);

        this.input = new PriBSFormInputText();
        this.addChild(this.input);

        this.label.formElement = this.input;

        this.select = new PriBSFormSelect();
        this.select.data = [
            "Item 1",
            "Item 2",
            "Item 3",
            "Item 4",
            "Item 5"
        ];
        this.addChild(this.select);

        this.button = new PriBSFormButton();
        this.button.text = "Button";
        this.addChild(this.button);

        this.buttonWithBadge = new PriBSFormButton();
        this.buttonWithBadge.text = "Button With Badge";
        this.buttonWithBadge.badge = "Badge";
        this.addChild(this.buttonWithBadge);
    }

    override private function paint():Void {
        var space:Int = 20;

        this.label.width = this.width/2;
        this.label.centerX = this.width/2;
        this.label.y = space;

        this.input.width = this.width/2;
        this.input.centerX = this.width/2;
        this.input.y = this.label.maxY + space;

        this.select.width = this.width/2;
        this.select.centerX = this.width/2;
        this.select.y = this.input.maxY + space;

        this.button.width = this.width/2;
        this.button.centerX = this.width/2;
        this.button.y = this.select.maxY + space;

        this.buttonWithBadge.width = this.width/2;
        this.buttonWithBadge.centerX = this.width/2;
        this.buttonWithBadge.y = this.button.maxY + space;
    }
}
