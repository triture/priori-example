package ;

import priori.assets.AssetAudio;
import view.content.ContentScene;
import priori.assets.AssetImage;
import priori.assets.AssetManager;
import view.preload.PreloadScene;
import priori.scene.manager.SceneManager;
import priori.style.font.PriFontStyle;
import priori.app.PriApp;

class PriDemoApp extends PriApp {

    public function new() {
        super();

        // default styles
        PriFontStyle.DEFAULT_FAMILY = "'PT Sans', sans-serif"; // USIGN GOOGLE FONTS
        PriFontStyle.DEFAULT_COLOR = 0x19385F;

        AssetManager.g().addToQueue(new AssetImage("image_example", "assets/media_image.jpg"));
        AssetManager.g().addToQueue(new AssetAudio("audio_example", "assets/media_audio.mp3", "assets/media_audio.ogg"));

        SceneManager.g().preload(ContentScene, PreloadScene, this.onErrorCallBack);
    }

    private function onErrorCallBack():Void {
        trace("error");
    }

}
