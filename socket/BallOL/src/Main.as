package
{
    import core.Client;
    import core.Game;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.geom.Point;
    import flash.ui.Keyboard;
    import org.phpz.net.SocketMessage;
    import ui.Ball;
    import utils.KeyManager;
    
    /**
     * Socket 演示 (多人在线)
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        static private const SPEED:int = 5;
        
        private var uid:String;
        
        private var game:Game;
        
        public function Main():void
        {
            game = new Game();
            addChild(game);
            
            Client.x.msgHandler = msgHandler;
            Client.x.connect('127.0.0.1', 7777);
            
            stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
            stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        }
        
        private function onKeyDown(e:KeyboardEvent):void
        {
            KeyManager.master.addKey(e.keyCode);
            if (!hasEventListener(Event.ENTER_FRAME))
            {
                addEventListener(Event.ENTER_FRAME, onFrame);
            }
        }
        
        private function onFrame(e:Event):void
        {
            var ball:Ball;
            var xOffset:int = 0, yOffset:int = 0;
            if (KeyManager.master.hasOne([Keyboard.UP, Keyboard.W]))
            {
                yOffset -= SPEED;
            }
            if (KeyManager.master.hasOne([Keyboard.DOWN, Keyboard.S]))
            {
                yOffset += SPEED;
            }
            if (KeyManager.master.hasOne([Keyboard.LEFT, Keyboard.A]))
            {
                xOffset -= SPEED;
            }
            if (KeyManager.master.hasOne([Keyboard.RIGHT, Keyboard.D]))
            {
                xOffset += SPEED;
            }
            ball = game.move(uid, new Point(xOffset, yOffset));
            Client.x.send(SocketMessage.TEXT, uid, {x: ball.x, y: ball.y});
        }
        
        private function onKeyUp(e:KeyboardEvent):void
        {
            KeyManager.master.delKey(e.keyCode);
            if (KeyManager.master.isEmpty)
            {
                removeEventListener(Event.ENTER_FRAME, onFrame);
            }
        }
        
        // 是否第一次获得用户列表
        private var oneList:Boolean = false;
        
        private function msgHandler(msg:SocketMessage):void
        {
            var ball:Ball, list:Array;
            trace(msg.type);
            switch (msg.type)
            {
                case SocketMessage.ME: 
                    trace(msg.from);
                    uid = msg.from;
                    ball = game.addBall(uid);
                    Client.x.send(SocketMessage.LOGIN, uid, {name: ball.color});
                    break;
                case SocketMessage.JOIN: 
                    break;
                case SocketMessage.QUIT: 
                    game.removeBall(msg.from);
                    break;
                case SocketMessage.LIST: 
                    if (!oneList)
                    {
                        // 第一次获取用户列表, 初始化全部球
                        oneList = true;
                        list = msg.body as Array;
                        trace(JSON.stringify(list));
                        for (var i:int = 0, l:int = list.length; i < l; i++)
                        {
                            if (list[i].uid != uid)
                            {
                                game.addBall(list[i].uid, list[i].body.name);
                            }
                        }
                    }
                    break;
                case SocketMessage.TEXT: 
                    if (uid != msg.from)
                    {
                        var newPoint:Point = new Point(msg.body.x, msg.body.y);
                        game.moveTo(msg.from, newPoint);
                    }
                    break;
                case SocketMessage.LOGIN: 
                    // 有用户加入, 添加新的球
                    if (msg.from != uid)
                    {
                        game.addBall(msg.from, msg.body.name);
                    }
                    break;
                default: 
                    break;
            }
        }
    
    }

}