package com.nicegame.motion
{
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Dir
    {
        
        // 方向 - 停止
        public static const DIR_STOP:int = -1;
        
        // 八方向对应索引
        public static const DIR_DOWN:int = 0;
        public static const DIR_LEFT:int = 1;
        public static const DIR_RIGHT:int = 2;
        public static const DIR_UP:int = 3;
        public static const DIR_DOWN_LEFT:int = 4;
        public static const DIR_DOWN_RIGHT:int = 5;
        public static const DIR_UP_LEFT:int = 6;
        public static const DIR_UP_RIGHT:int = 7;
        
        // 90度角方向对应数值
        public static const KEY_UP:uint = 1;
        public static const KEY_RIGHT:uint = 2;
        public static const KEY_DOWN:uint = 4;
        public static const KEY_LEFT:uint = 8;
        
        // 45度角方向, 等于相邻两方向值的和
        public static const KEY_UP_RIGHT:uint = 3;
        public static const KEY_UP_LEFT:uint = 9;
        public static const KEY_DOWN_RIGHT:uint = 6;
        public static const KEY_DOWN_LEFT:uint = 12;
        
        /**
         * 按键转换成方向
         * @param key   按键
         * @return  方向
         */
        public static function key2dir(key:uint):int
        {
            var result:int;
            
            switch (key)
            {
                case KEY_UP: 
                    result = DIR_UP;
                    break;
                case KEY_RIGHT: 
                    result = DIR_RIGHT;
                    break;
                case KEY_DOWN: 
                    result = DIR_DOWN;
                    break;
                case KEY_LEFT: 
                    result = DIR_LEFT;
                    break;
                case KEY_UP_LEFT: 
                    result = DIR_UP_LEFT;
                    break;
                case KEY_UP_RIGHT: 
                    result = DIR_UP_RIGHT;
                    break;
                case KEY_DOWN_LEFT: 
                    result = DIR_DOWN_LEFT;
                    break;
                case KEY_DOWN_RIGHT: 
                    result = DIR_DOWN_RIGHT;
                    break;
                default: 
                    result = DIR_STOP;
                    break;
            }
            
            return result;
        }
    }

}