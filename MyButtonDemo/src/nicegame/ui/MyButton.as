package nicegame.ui
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.filters.GlowFilter;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;
    import flash.utils.setTimeout;
    
    /**
     * MyButton
     * @author Seven Yu
     */
    public class MyButton extends Sprite
    {
        
        // 状态常量定义 (思考:常量的优点)
        private const STATE_NORMAL:uint = 1;
        private const STATE_OVER:uint = 2;
        private const STATE_OUT:uint = 3;
        private const STATE_DOWN:uint = 4;
        private const STATE_UP:uint = 5;
        private const STATE_DISABLE:uint = 9;
        
        // 按钮文本
        private var txtLabel:TextField;
        
        private var _label:String;
        private var _buttonWidth:int;
        private var _buttonHeight:int;
        
        // 记录当前状态
        private var _currentState:uint;
        
        // 记录颜色
        private var _normal:uint;
        private var _over:uint;
        private var _down:uint;
        private var _disable:uint;
        
        // 按钮是否可用状态标示变量
        private var _enable:Boolean = true;
        
        // 按钮其他属性
        private var _font:String = 'consolas';
        private var _size:uint = 14;
        private var _color:uint = 0xffffff;
        
        /**
         * 自定义按钮
         * @param label         按钮文本
         * @param buttonWidth   按钮宽度
         * @param buttonHeight  按钮高度
         * @param normalColor   常规状态颜色
         * @param overColor     悬停颜色
         * @param downColor     鼠标按下颜色
         * @param disableColor  不可用状态颜色
         * @deprecated <b>初始化按钮</b>
         */
        public function MyButton(label:String = 'label', buttonWidth:int = 100, buttonHeight:int = 30, normalColor:uint = 0x008000, overColor:uint = 0xffcc00, downColor:uint = 0x00ccff, disableColor:uint = 0xcccccc)
        {
            // 禁用子元素鼠标响应
            mouseChildren = false;
            buttonMode = true;
            
            // 保存参数属性
            _label = label;
            _buttonWidth = buttonWidth;
            _buttonHeight = buttonHeight;
            
            _normal = normalColor;
            _over = overColor;
            _down = downColor;
            _disable = disableColor;
            
            // 初始化界面
            initUI();
        }
        
        /**
         * 初始化界面
         */
        private function initUI():void
        {
            txtLabel = new TextField();
            
            txtLabel.autoSize = TextFieldAutoSize.LEFT;
            txtLabel.text = _label;
            
            setTextFormat();
            
            addChild(txtLabel);
            // 文本框居中
            moveLabel();
            
            // 按状态绘制按钮
            setState(STATE_NORMAL);
            
            // 绑定事件
            this.addEventListener(MouseEvent.MOUSE_OVER, onOver);
            this.addEventListener(MouseEvent.MOUSE_OUT, onOut);
            this.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
            this.addEventListener(MouseEvent.MOUSE_UP, onUp);
        }
        
        /**
         * 检测按钮
         */
        public function check():void
        {
            this.filters = [new GlowFilter(0xff0000, 0.7, 8, 8, 4)];
            
            setTimeout(function(button:MyButton):void
                {
                    button.filters = [];
                }, 1500, this);
        }
        
        /**
         * 重置文本样式
         */
        private function setTextFormat():void
        {
            var tf:TextFormat = new TextFormat(_font, _size, _color);
            txtLabel.defaultTextFormat = tf;
            txtLabel.setTextFormat(tf);
            // 重置文本框位置
            moveLabel();
        }
        
        // ===============================
        // - 按钮事件, 若不可用则直接返回 -
        // ===============================
        private function onOver(e:MouseEvent):void
        {
            if (!_enable)
            {
                return;
            }
            setState(STATE_OVER);
        }
        
        private function onOut(e:MouseEvent):void
        {
            if (!_enable)
            {
                return;
            }
            setState(STATE_OUT);
        }
        
        private function onDown(e:MouseEvent):void
        {
            if (!_enable)
            {
                return;
            }
            setState(STATE_DOWN);
        }
        
        private function onUp(e:MouseEvent):void
        {
            if (!_enable)
            {
                return;
            }
            setState(STATE_UP);
        }
        
        /**
         * 按状态绘制按钮
         * @param state     按钮状态
         */
        private function setState(state:uint):void
        {
            // 保存当前状态
            _currentState = state;
            // 执行具体绘制
            drawState(state);
        }
        
        /**
         * 绘制按钮
         * @param state     按钮状态
         */
        private function drawState(state:uint):void
        {
            var color:uint;
            switch (state)
            {
                // 鼠标经过和鼠标抬起是一种状态
                case STATE_OVER: 
                case STATE_UP: 
                {
                    color = _over;
                    break;
                }
                // 鼠标按下
                case STATE_DOWN: 
                {
                    color = _down;
                    break;
                }
                // 按钮不可用
                case STATE_DISABLE: 
                {
                    color = _disable;
                    break;
                }
                // 鼠标移出和正常状态是同一种
                case STATE_OUT: 
                case STATE_NORMAL: 
                default: 
                {
                    color = _normal;
                    break;
                }
            }
            
            // 绘制过程
            this.graphics.clear();
            this.graphics.beginFill(color);
            this.graphics.drawRect(0, 0, _buttonWidth, _buttonHeight);
            this.graphics.endFill();
        }
        
        /**
         * 覆盖父类 width 属性
         */
        override public function set width(value:Number):void
        {
            _buttonWidth = value;
            setState(_currentState);
            moveLabel();
        }
        
        /**
         * 覆盖父类 height 属性
         */
        override public function set height(value:Number):void
        {
            _buttonHeight = value;
            setState(_currentState);
            moveLabel();
        }
        
        /**
         * 鼠标可用状态
         */
        public function get enable():Boolean
        {
            return _enable;
        }
        
        public function set enable(value:Boolean):void
        {
            _enable = value;
            buttonMode = value;
            setState(value ? STATE_NORMAL : STATE_DISABLE);
        }
        
        /**
         * 按钮文本
         */
        public function get label():String
        {
            return _label;
        }
        
        public function set label(value:String):void
        {
            _label = value;
            txtLabel.text = value;
            
            moveLabel();
        }
        
        /**
         * 按钮文本字体
         */
        public function get font():String
        {
            return _font;
        }
        
        public function set font(value:String):void
        {
            _font = value;
            setTextFormat();
        }
        
        /**
         * 按钮文本字号
         */
        public function get size():uint
        {
            return _size;
        }
        
        public function set size(value:uint):void
        {
            _size = value;
            setTextFormat();
        }
        
        /**
         * 按钮文本颜色
         */
        public function get color():uint
        {
            return _color;
        }
        
        public function set color(value:uint):void
        {
            _color = value;
            setTextFormat();
        }
        
        /**
         * 按钮标签居中
         */
        private function moveLabel():void
        {
            txtLabel.x = (_buttonWidth - txtLabel.width) / 2;
            txtLabel.y = (_buttonHeight - txtLabel.height) / 2;
        }
    
    }

}