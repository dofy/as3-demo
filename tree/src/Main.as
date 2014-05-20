package
{
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.DataEvent;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    
    /**
     * 文档类
     */
    public class Main extends Sprite
    {
        private var tree:Tree;
        
        private var player:Player;
        
        public function Main():void
        {
            // 加载 xml 文件
            var ur:URLRequest = new URLRequest('tree.xml');
            var ul:URLLoader = new URLLoader();
            ul.addEventListener(Event.COMPLETE, onComplete);
            ul.load(ur);
        }
        
        /**
         * 加载完成, 创建目录树, 加载 player
         * @param e
         */
        private function onComplete(e:Event):void
        {
            // 创建目录树
            tree = new Tree(XML(e.target.data));
            // 添加点击事件监听
            tree.addEventListener(TreeEvent.NODE_CLICK, onNodeClick);
            addChild(tree);
            
            // 加载 player
            player = new Player();
            addChild(player);
            player.x = 150;
        }
        
        private function onNodeClick(e:TreeEvent):void
        {
            // 播放影片
            if (e.url != '')
            {
                player.play(e.title, e.url);
            }
        }
    }

}