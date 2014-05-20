package
{
    import flash.net.LocalConnection;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Tool
    {
        
        public static function gc():void
        {
            var lc:LocalConnection = new LocalConnection();
            try
            {
                lc.connect('__lclc');
                lc.connect('__lclc');
            }
            catch (e:ArgumentError)
            {
                trace(e);
            }
        
        }
    
    }

}