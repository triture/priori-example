package view.content.examples.disable;

import priori.bootstrap.PriBSFormInputText;
import priori.bootstrap.PriBSFormLabel;
import priori.view.layout.PriVerticalLayout;

class AddressForm extends PriVerticalLayout {

    private var addressLabel:PriBSFormLabel;
    private var address:PriBSFormInputText;

    private var numberLabel:PriBSFormLabel;
    private var number:PriBSFormInputText;

    public function new() {
        super();

        this.gap = 10;
        this.bgColor = 0xFFFFFF;
        this.autoSizeContainer = true;
        this.autoSizeElements = false;

        this.corners = [5];
    }

    override private function setup():Void {
        this.addressLabel = new PriBSFormLabel();
        this.addressLabel.text = "Address";
        this.addChild(this.addressLabel);

        this.address = new PriBSFormInputText();
        this.addChild(this.address);
        this.addressLabel.formElement = this.address;

        this.numberLabel = new PriBSFormLabel();
        this.numberLabel.text = "Number";
        this.addChild(this.numberLabel);

        this.number = new PriBSFormInputText();
        this.addChild(this.number);
        this.numberLabel.formElement = this.number;
    }

    override private function paint():Void {
        super.paint();

        this.address.width = this.width - this.gap * 2;
        this.number.width = this.width / 2;
    }
}
