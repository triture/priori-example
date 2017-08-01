package view.content;

import components.menu.Menu;
import components.content.ContentManager;
import priori.scene.view.PriScene;
import priori.system.PriDevice;

class ContentScene extends PriScene {

    private var menu:Menu;
    private var content:ContentManager;

    public function new() {
        super();
    }

    override private function setup():Void {
        this.menu = new Menu();
        this.addChild(this.menu);

        this.content = ContentManager.global();
        this.addChild(this.content);
    }

    override private function paint():Void {
        this.menu.x = 0;
        this.menu.y = 0;
        this.menu.height = this.height;

        if (PriDevice.isMobileDevice()) {
            this.menu.width = 60;
        } else {
            this.menu.width = 250;
        }

        this.content.x = this.menu.maxX;
        this.content.y = 0;
        this.content.width = this.width - this.content.x;
        this.content.height = this.height;
    }
}
