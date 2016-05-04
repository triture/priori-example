package view.content.examples;

import priori.view.container.PriScrollableContainer;
import priori.style.font.PriFontStyleItalic;
import priori.style.font.PriFontStyleWeight;
import priori.style.font.PriFontStyle;
import priori.view.text.PriText;
import priori.view.container.PriGroup;

class TextContent extends PriGroup {

    private var t1:PriText;
    private var t2:PriText;
    private var t3:PriText;
    private var t4:PriText;
    private var t5:PriText;

    private var t6:PriText;
    private var container:PriScrollableContainer;

    private var text:String = "The quick brown fox jumps over the lazy dog";

    public function new() {
        super();
    }

    override private function setup():Void {
        this.t1 = new PriText();
        this.t1.text = this.text;
        this.addChild(this.t1);

        this.t2 = new PriText();
        this.t2.text = this.text;
        this.t2.fontStyle = new PriFontStyle(PriFontStyleWeight.BOLD);
        this.addChild(this.t2);

        this.t3 = new PriText();
        this.t3.text = this.text;
        this.t3.fontSize = 20;
        this.t3.fontStyle = new PriFontStyle(PriFontStyleItalic.ITALIC);
        this.addChild(this.t3);

        this.t4 = new PriText();
        this.t4.text = this.text;
        this.t4.fontSize = 25;
        this.t4.fontStyle = new PriFontStyle(PriFontStyleWeight.BOLD, PriFontStyleItalic.ITALIC);
        this.addChild(this.t4);

        this.t5 = new PriText();
        this.t5.text = this.text;
        this.t5.fontSize = 30;
        this.t5.fontStyle = new PriFontStyle(0xFF0000, "Arial", PriFontStyleWeight.BOLD);
        this.addChild(this.t5);


        this.container = new PriScrollableContainer();
        this.container.bgColor = 0xAAAAAA;
        this.addChild(this.container);

        this.t6 = new PriText();
        this.t6.autoSize = true;
        this.t6.multiLine = true;
        this.t6.fontStyle = new PriFontStyle(); // using all defaults
        this.t6.html = "<b>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend mi ut placerat feugiat. Nunc sed lectus ac lectus laoreet euismod. In eget mauris a tellus aliquam interdum. Suspendisse aliquam risus mauris, non ullamcorper enim maximus sit amet. Vestibulum tincidunt ultrices sem at tempor. Curabitur a eleifend elit, quis rutrum est. Donec eget dapibus lorem. Aenean pulvinar fermentum orci a malesuada. Duis condimentum sem non urna iaculis condimentum. Cras bibendum est euismod, faucibus urna ut, dictum nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec volutpat non nunc a laoreet. Nam aliquam, sapien nec aliquam finibus, justo enim eleifend nisl, ut ultrices velit erat vitae tellus. Phasellus in laoreet diam. Donec molestie justo sem, vitae sollicitudin arcu euismod sit amet.</b><br><br>
Nam volutpat iaculis ex vel consequat. Fusce quis urna nec lacus feugiat tincidunt nec a risus. Cras sollicitudin mi ex, consectetur interdum elit varius vel. Curabitur nisl leo, ullamcorper ut iaculis sodales, pharetra sit amet mauris. Aliquam purus enim, tempus eu ex sed, condimentum consectetur dui. Vestibulum sit amet lacus eget felis pharetra euismod. Maecenas at auctor neque. Vestibulum malesuada nunc at lacus cursus auctor. Proin eget auctor odio, nec elementum mauris. Mauris nec massa finibus, accumsan magna ac, venenatis eros. Curabitur at risus vitae velit luctus imperdiet ut sed lacus. Nulla efficitur interdum tincidunt. Donec viverra, velit id dictum lobortis, felis quam accumsan quam, vitae condimentum purus turpis vitae tellus. Suspendisse potenti. Proin volutpat mi ac augue ullamcorper, non fringilla magna ultrices.<br><br>
Nunc finibus gravida metus pulvinar fringilla. Curabitur elementum libero tellus, ac ornare neque dignissim ac. Pellentesque ac vulputate dolor. Donec luctus ac metus non posuere. Duis finibus laoreet venenatis. Donec mattis convallis mollis. Morbi quis facilisis purus, imperdiet fringilla sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.<br><br>
<ol>
  <li>List Item 1</li>
  <li>List Item 2</li>
  <li>List Item 3</li>
</ol>
Mauris lacus mi, euismod et gravida ut, scelerisque blandit tortor. Curabitur vel sollicitudin velit. Vivamus in magna tempus ligula tempus eleifend. Vestibulum id enim porta, laoreet nulla ac, rutrum justo. Proin in nibh nisi. Aenean pellentesque gravida lorem, nec vulputate lorem feugiat vel. Maecenas nec mollis orci, sed lacinia arcu. Phasellus ac iaculis nibh. Quisque cursus tellus at aliquet tincidunt. Donec orci nisi, venenatis sed nisi ut, egestas vulputate nunc. Aenean risus libero, pharetra id ipsum ut, aliquet ultricies velit.<br><br>
Praesent nec mollis lectus. Maecenas imperdiet pretium justo. Aliquam ornare, dui commodo feugiat bibendum, arcu leo hendrerit nunc, vel egestas neque est vel nisl. Pellentesque eget nunc elementum enim consequat finibus eu nec tortor. Nam et elit et metus maximus commodo id dictum lacus. Quisque rutrum porta consectetur. Sed commodo elementum eros, vitae blandit sapien fermentum ut. Sed a scelerisque lorem. Quisque pharetra ut libero id volutpat. Quisque erat mi, imperdiet a felis ultrices, tincidunt semper dui. Proin venenatis leo sem. Nam velit elit, suscipit quis neque vitae, tincidunt ullamcorper neque. Proin tincidunt nibh ac massa auctor, ac venenatis lectus semper. Nam sed pharetra sapien, vel tempus sapien.";
        this.container.addChild(this.t6);

    }

    override private function paint():Void {
        var margin:Float = 20;

        this.t1.x = margin;
        this.t1.y = margin;

        this.t2.x = margin;
        this.t2.y = this.t1.maxY;

        this.t3.x = margin;
        this.t3.y = this.t2.maxY;

        this.t4.x = margin;
        this.t4.y = this.t3.maxY;

        this.t5.x = margin;
        this.t5.y = this.t4.maxY;

        this.container.width = this.width - margin*2;
        this.container.x = margin;
        this.container.y = this.t5.maxY + margin;
        this.container.height = this.height - this.container.y - margin;

        this.t6.width = this.container.width;
    }
}
