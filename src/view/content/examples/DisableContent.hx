package view.content.examples;

import priori.event.PriTapEvent;
import priori.bootstrap.PriBSFormButton;
import view.content.examples.disable.FormExample;
import priori.event.PriEvent;
import priori.bootstrap.PriBSFormSelect;
import priori.view.container.PriContainer;
import priori.view.container.PriGroup;

class DisableContent extends PriGroup {

    private var changeAll:PriBSFormSelect;
    private var changeAddress:PriBSFormSelect;
    private var addRemoveButton:PriBSFormButton;

    private var container:PriContainer;
    private var formComponent:FormExample;

    public function new() {
        super();
    }

    override private function setup():Void {
        this.changeAll = new PriBSFormSelect();
        this.changeAll.data = [
            {
                label : "Enable All Form",
                val : 1
            },
            {
                label : "Disable All Form",
                val : 2
            }
        ];
        this.changeAll.addEventListener(PriEvent.CHANGE, onChange);
        this.addChild(this.changeAll);

        this.changeAddress = new PriBSFormSelect();
        this.changeAddress.data = [
            {
                label : "Enable Address Form",
                val : 1
            },
            {
                label : "Disable Address Form",
                val : 2
            }
        ];
        this.changeAddress.addEventListener(PriEvent.CHANGE, onAddressChange);
        this.addChild(this.changeAddress);

        this.addRemoveButton = new PriBSFormButton();
        this.addRemoveButton.text = "Remove Address From Display";
        this.addRemoveButton.addEventListener(PriTapEvent.TAP, onButton);
        this.addChild(this.addRemoveButton);

        this.container = new PriContainer();
        this.container.bgColor = 0xCCCCCC;
        this.addChild(this.container);

        this.formComponent = new FormExample();
        this.container.addChild(this.formComponent);
    }

    override private function paint():Void {
        var space:Int = 20;

        this.changeAll.width = 200;
        this.changeAll.x = space;
        this.changeAll.y = space;

        this.changeAddress.width = 200;
        this.changeAddress.x = this.changeAll.maxX + space;
        this.changeAddress.y = space;

        this.addRemoveButton.width = 250;
        this.addRemoveButton.x = this.changeAddress.maxX + space;
        this.addRemoveButton.y = space;

        this.container.x = space;
        this.container.y = this.changeAll.maxY + space;
        this.container.width = this.width - space*2;
        this.container.height = this.height - this.container.y - space;

        this.formComponent.x = space;
        this.formComponent.y = space;
        this.formComponent.width = this.container.width - space*2;
        this.formComponent.height = this.container.height - space*2;
        this.formComponent.validate();
    }

    private function onButton(e:PriTapEvent):Void {
        if (this.formComponent.address.parent == null) {
            this.addRemoveButton.text = "Remove Address From Display";
            this.formComponent.layout.addChild(this.formComponent.address);
        } else {
            this.addRemoveButton.text = "Add Address From Display";
            this.formComponent.address.removeFromParent();
        }

        this.formComponent.invalidate();
        this.formComponent.validate();
    }

    private function onAddressChange(e:PriEvent):Void {
        if (this.changeAddress.selected.val == 1) {
            this.formComponent.address.disabled = false;
        } else {
            this.formComponent.address.disabled = true;
        }
    }

    private function onChange(e:PriEvent):Void {
        if (this.changeAll.selected.val == 1) {
            this.container.disabled = false;
        } else {
            this.container.disabled = true;
        }
    }
}
