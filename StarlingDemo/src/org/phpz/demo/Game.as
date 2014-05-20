package org.phpz.demo
{
    import flash.text.TextFieldAutoSize;
    import flash.utils.getTimer;
    import org.phpz.Assets;
    import starling.animation.Transitions;
    import starling.animation.Tween;
    import starling.core.Starling;
    import starling.display.Button;
    import starling.display.Image;
    import starling.display.MovieClip;
    import starling.display.Sprite;
    import starling.events.EnterFrameEvent;
    import starling.events.Event;
    import starling.text.TextField;
    import starling.textures.Texture;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Game extends Sprite
    {
        private var mc1:MovieClip;
        private var mc2:MovieClip;
        private var logo:Button;
        private var tween1:Tween;
        private var tween2:Tween;
        
        
        [Embed(source = "../../../../assets/ta.png")]
        private var IMG:Class;
        
        public function Game()
        {
            //stage.
            addEventListener(Event.ADDED_TO_STAGE, onAdded);
        }
        
        private function onAdded(e:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, onAdded);
            
            addEventListener(EnterFrameEvent.ENTER_FRAME, onFrame);
            
            
            //addChild(new Image(Texture.fromEmbeddedAsset(IMG)));
            
            var tf:TextField = new TextField(400, 30, '--== MY FIRST STARLING DEMO ==--');
            tf.x = stage.stageWidth - tf.width >> 1;
            addChild(tf);
            
            var tx:TextField = new TextField(100, 20, 'asdfasdf', 'consolas', 20, 0xffcc00);
            addChild(tx).y = 400;
            
            var img:Image = new Image(Assets.getTexture('logo'));
            addChild(img);
            img.y = 500;
            
            logo = new Button(Assets.getTexture('logo'));
            addChild(logo);
            logo.x = stage.stageWidth - logo.width >> 1;
            logo.y = 50;
            logo.addEventListener(Event.TRIGGERED, onTriggered);
            
            mc1 = new MovieClip(Assets.getTextures('mt1'), 24);
            Starling.juggler.add(mc1);
            addChild(mc1);
            mc1.y = 200;
            
            mc2 = new MovieClip(Assets.getTextures('mt2'), 24);
            Starling.juggler.add(mc2);
            //addChild(mc2);
            mc2.y = 400;
            
            Transitions.register('mytrans', function(a:Number):Number
                {
                    return a;
                });
            
            //tween1 = new Tween(mc1, 1, Transitions.EASE_IN_BACK);
            //tween1.moveTo(200, 200);
            //
            //Starling.juggler.add(tween1);
            
            //Starling.juggler.add(tween2);
            Starling.juggler.tween(mc1, 1, {x: 200, transition: Transitions.EASE_IN_OUT});
            Starling.juggler.tween(mc2, 1, {x: 200, transition: 'mytrans'});
        }
        
        private function onFrame(e:EnterFrameEvent):void
        {
            //trace(e.passedTime);
            logo.y = 50 + Math.cos(getTimer() * 0.005) * 5;
            //Starling.juggler.advanceTime(e.passedTime);
            //tween1.advanceTime(e.passedTime);
        }
        
        private function onTriggered(e:Event):void
        {
        }
    
    }

}