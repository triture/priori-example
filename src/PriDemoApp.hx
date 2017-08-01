package ;

import view.content.ContentScene;
import priori.assets.AssetImage;
import priori.assets.AssetManager;
import view.preload.PreloadScene;
import priori.scene.manager.SceneManager;
import priori.style.font.PriFontStyle;
import priori.app.PriApp;

class PriDemoApp extends PriApp {

    public function new() {

        // default styles
        PriFontStyle.DEFAULT_FAMILY = "'PT Sans', sans-serif"; // USIGN GOOGLE FONTS
        PriFontStyle.DEFAULT_COLOR = 0x19385F;

        super();

        AssetManager.g().addToQueue(new AssetImage("image_example", "assets/media_image.jpg"));
        AssetManager.g().addToQueue(new AssetImage("nineslice_example_1", "assets/nineslicetest01.png"));
        AssetManager.g().addToQueue(new AssetImage("nineslice_example_2", "assets/nineslicetest02.png"));

        #if debug
        SceneManager.g().preload(view.content.PerformanceScene, PreloadScene, this.onErrorCallBack);
        #else
        SceneManager.g().preload(ContentScene, PreloadScene, this.onErrorCallBack);
        #end
    }

    private function onErrorCallBack():Void {
        trace("error");
    }

}
