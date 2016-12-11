package view.content.examples.transform;

import priori.view.text.PriText;
import priori.view.container.PriContainer;

class TransItemBlock extends PriContainer {

    private var text:PriText;

    public function new(id:String, color:Int) {
        super();

        this.width = 150;
        this.height = 150;

        this.bgColor = color;

        this.text = new PriText();
        this.text.fontSize = 25;
        this.text.text = id;
        this.addChild(this.text);

        this.text.centerX = this.width/2;
        this.text.centerY = this.height/2;
    }
}
