package view.content.examples;

import priori.view.form.PriFormCheckBox;
import priori.view.form.PriFormTextArea;
import priori.event.PriMouseEvent;
import priori.view.form.PriFormButton;
import priori.event.PriEvent;
import priori.view.form.PriFormSelect;
import priori.style.font.PriFontStyleItalic;
import priori.style.font.PriFontStyleWeight;
import priori.style.border.PriBorderStyle;
import priori.view.form.PriFormLabel;
import priori.style.shadow.PriShadowPresets;
import priori.style.font.PriFontStyle;
import priori.view.form.PriFormInputText;
import priori.view.container.PriGroup;

class FormStyleContent extends PriGroup {

    private var label_1:PriFormLabel;
    private var field_1:PriFormInputText;

    private var label_2:PriFormLabel;
    private var field_2:PriFormInputText;

    private var field_3:PriFormSelect;

    private var button_1:PriFormButton;

    private var area_1:PriFormTextArea;

    public function new() {
        super();
    }

    override private function setup():Void {

        this.label_1 = new PriFormLabel();
        this.label_1.fontStyle = new PriFontStyle("Arial");
        this.label_1.formElement = this.field_1;
        this.label_1.text = "Label 1:";

        this.field_1 = new PriFormInputText();
        this.field_1.bgColor = 0x158078;
        this.field_1.fontStyle = new PriFontStyle(0xFFFFFF);
        this.field_1.corners = [4];
        this.field_1.shadow = PriShadowPresets.SLIM_SHADOW;
        this.field_1.marginLeft = 10;
        this.field_1.marginRight = 10;



        this.label_2 = new PriFormLabel();
        this.label_2.formElement = this.field_1;
        this.label_2.text = "Label 2:";
        this.label_2.fontStyle = new PriFontStyle(0xFF0000, PriFontStyleItalic.ITALIC);

        this.field_2 = new PriFormInputText();
        this.field_2.bgColor = 0xFFFFFF;
        this.field_2.border = new PriBorderStyle(1, 0xcccccc);
        this.field_2.fontStyle = new PriFontStyle(0x333333, PriFontStyleWeight.BOLD);
        this.field_2.corners = [3];
        this.field_2.shadow = PriShadowPresets.SIMPLE_INNER_SHADOW;
        this.field_2.marginLeft = 10;
        this.field_2.marginRight = 10;



        this.field_3 = new PriFormSelect();
        this.field_3.bgColor = 0xf6f6f6;
        this.field_3.border = new PriBorderStyle(2, 0xcccccc);
        this.field_3.fontSize = 25;
        this.field_3.corners = [3];
        this.field_3.labelField = "name";
        this.field_3.addEventListener(PriEvent.CHANGE, this.onChangeSelect);
        this.field_3.data = [
            {
                name : "Red",
                value : 0xFF0000
            },
            {
                name : "Green",
                value : 0x00FF00
            },
            {
                name : "Blue",
                value : 0x0000FF
            }
        ];
        this.onChangeSelect(null);


        this.button_1 = new PriFormButton();
        this.button_1.text = "Button Label";
        this.button_1.bgColor = 0x31b0d5;
        this.button_1.border = new PriBorderStyle(1, 0x269abc);
        this.button_1.height = 40;
        this.button_1.corners = [3];
        this.button_1.fontStyle = new PriFontStyle(0xFFFFFF, PriFontStyleWeight.NORMAL);
        this.button_1.addEventListener(PriMouseEvent.MOUSE_OVER, this.onMouse);
        this.button_1.addEventListener(PriMouseEvent.MOUSE_OUT, this.onMouse);


        this.area_1 = new PriFormTextArea();
        this.area_1.margin = 10;
        this.area_1.bgColor = 0xFFFFFF;
        this.area_1.width = 300;
        this.area_1.height = 300;
        this.area_1.border = new PriBorderStyle(1, 0xcccccc);
        this.area_1.shadow = PriShadowPresets.SIMPLE_INNER_SHADOW;
        this.area_1.corners = [4];
        this.area_1.value = "text area \nline 1";

        this.addChildList(
            [
                this.label_1,
                this.field_1,
                this.label_2,
                this.field_2,
                this.field_3,
                this.button_1,
                this.area_1
            ]
        );
    }

    private function onMouse(e:PriMouseEvent):Void {
        if (e.type == PriMouseEvent.MOUSE_OVER) {
            this.button_1.bgColor = 0x269abc;
        } else {
            this.button_1.bgColor = 0x31b0d5;
        }
    }
    private function onChangeSelect(e:PriEvent):Void {
        this.field_3.fontStyle = new PriFontStyle(this.field_3.selected.value, PriFontStyleWeight.BOLD);
    }

    override private function paint():Void {
        var space:Int = 10;

        this.label_1.x = space;
        this.field_1.x = this.label_1.maxX + space;
        this.field_1.y = space;
        this.field_1.height = 40;
        this.label_1.centerY = this.field_1.centerY;
        this.field_1.width = 200;


        this.label_2.x = space;
        this.field_2.x = this.label_2.maxX + space;
        this.field_2.y = this.field_1.maxY + space;
        this.field_2.height = 40;
        this.label_2.centerY = this.field_2.centerY;
        this.field_2.width = 200;


        this.field_3.x = space;
        this.field_3.y = this.field_2.maxY + space;
        this.field_3.width = 200;
        this.field_3.height = 40;

        this.button_1.x = space;
        this.button_1.y = this.field_3.maxY + space;


        this.area_1.x = space;
        this.area_1.y = this.button_1.maxY + space;
    }
}
