package nicegame.demo.model
{
    import nicegame.demo.FacadeApp;
    import nicegame.demo.model.vo.GameVO;
    import org.puremvc.as3.interfaces.IProxy;
    import org.puremvc.as3.patterns.proxy.Proxy;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class GameDataProxy extends Proxy implements IProxy
    {
        
        public static const NAME:String = 'gameDataProxy';
        
        public function GameDataProxy()
        {
            super(NAME, new GameVO);
        }
        
        public function get gameData():GameVO
        {
            return data as GameVO;
        }
        
        public function get state():int
        {
            return gameData.state;
        }
        
        public function set state(value:int):void
        {
            gameData.state = value;
            sendNotification(FacadeApp.GAME_STATE_CHANGED, gameData);
        }
    
    }

}