package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 1209C
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
            // A 和 N 相当于被观察者
            var a:A = new A();
            var n:N = new N();
            
            // B C 为观察者(接收消息广播)
            var b:B = new B();
            var c:C = new C();
            
            a.myName = 'AAA';
            a.age = 16;
            
            // C 中有取消消息订阅到测试代码
            // 接收到第一个 NAME_CHANGE 后取消了订阅
            // C 不再接收 N 发送到相关消息
            
            n.myName = 'NNN';
		}
		
	}
	
}