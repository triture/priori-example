package components.content;

import priori.view.container.PriGroup;

class ContentManager extends PriGroup {

    private var currentContent:PriGroup;

    public function new() {
        super();
    }

    public function openContent(content:Class<PriGroup>):Void {

        if (this.currentContent != null) {
            this.removeChild(this.currentContent);
            this.currentContent.kill();

            this.currentContent = null;
        }

        this.currentContent = Type.createInstance(content, []);
        this.addChild(this.currentContent);

        this.validate();
    }

    override private function setup():Void {
        this.bgColor = 0xEEEEEE;
    }

    override private function paint():Void {
        if (this.currentContent != null) {
            this.currentContent.width = this.width;
            this.currentContent.height = this.height;
            this.currentContent.x = 0;
            this.currentContent.y = 0;
        }

    }


    private static var _global:ContentManager;
    public static function global():ContentManager {
        if (_global == null || _global.isKilled()) _global = new ContentManager();
        return _global;
    }
}
