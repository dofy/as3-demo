package
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.setTimeout;

	public class Kind extends Sprite
	{

		// 最大宽度
		private var _wide: int;

		public function Kind(wide: int)
		{
			// constructor code
			_wide = wide;

			this.addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}

		private function onAdded(e: Event): void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAdded);

			var g: Graphics = this.graphics,
				l: int = leng,
				w: int = wide;
			g.lineStyle(w, color);
			g.moveTo(0, 0);
			g.lineTo(0, -l);

			setTimeout(function (): void
			{
				addChildren(0, -l, w);
			}, 60);
		}

		private function addChildren(startX: int, startY: int, wide: int): void
		{
			if (wide <= 1)
				return;
			for (var k: Kind, i: int = 0, m: int = children; i < m; i++)
			{
				k = new Kind(wide);
				addChild(k);
				k.x = startX;
				k.y = startY;
				k.rotation = rota;
			}
		}

		// ================
		// --- chindren ---
		// ================
		private function get children(): int
		{
			return rand(3);
		}

		private function get rota(): int
		{
			return rand(45, -45);
		}

		// ============
		// --- self ---
		// ============
		private function get leng(): int
		{
			return rand(70, 30);
		}

		private function get color(): int
		{
			return rand(0xffffff);
		}

		private function get wide(): int
		{
			return rand(_wide, _wide / 7 * 5);
		}

		// =============
		// --- tools ---
		// =============
		private function rand(max: int, min: int = 0): int
		{
			return Math.round(Math.random() * (max - min)) + min;
		}

	}

}


// gejia@xpec.com.cn