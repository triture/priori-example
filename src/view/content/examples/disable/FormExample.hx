package view.content.examples.disable;

import priori.view.layout.PriVerticalLayout;
import priori.bootstrap.PriBSFormLabel;
import priori.bootstrap.PriBSFormDatePicker;
import priori.view.text.PriText;
import priori.event.PriTapEvent;
import priori.view.container.PriGroup;
import priori.bootstrap.PriBSFormButton;
import priori.bootstrap.PriBSFormInputText;


class FormExample extends PriGroup {

    public var layout:PriVerticalLayout;

    private var nameLabel:PriBSFormLabel;
    private var name:PriBSFormInputText;

    private var birthdayLabel:PriBSFormLabel;
    private var birthday:PriBSFormDatePicker;


    public var address:AddressForm;

    private var button:PriBSFormButton;
    private var info:PriText;

    public function new() {
        super();

        this.clipping = false;
    }

    override private function setup():Void {
        this.layout = new PriVerticalLayout();
        this.layout.autoSizeElements = true;
        this.layout.autoSizeContainer = true;
        this.layout.gap = 10;
        this.addChild(this.layout);

        this.nameLabel = new PriBSFormLabel();
        this.nameLabel.text = "Name";
        this.layout.addChild(this.nameLabel);

        this.name = new PriBSFormInputText();
        this.layout.addChild(this.name);
        this.nameLabel.formElement = this.name;

        this.birthdayLabel = new PriBSFormLabel();
        this.birthdayLabel.text = "Birthday";
        this.layout.addChild(this.birthdayLabel);

        this.birthday = new PriBSFormDatePicker();
        this.layout.addChild(this.birthday);
        this.birthdayLabel.formElement = this.birthday;

        this.address = new AddressForm();
        this.layout.addChild(this.address);

        this.button = new PriBSFormButton();
        this.button.addEventListener(PriTapEvent.TAP, onButton);
        this.button.text = "Ok";
        this.addChild(this.button);

        this.info = new PriText();
        this.addChild(this.info);
    }

    private function onButton(e:PriTapEvent):Void {
        this.info.text = "Address is on display list? " + this.address.hasApp();

        this.invalidate();
        this.validate();

        haxe.Timer.delay(function():Void {
            this.info.text = "";
        }, 1000);
    }

    override private function paint():Void {
        var space:Int = 10;

        this.layout.width = this.width;
        this.layout.validate();

        this.button.x = space;
        this.button.y = this.layout.maxY + space;

        this.info.x = this.button.maxX + space;
        this.info.centerY = this.button.centerY;
    }
}
