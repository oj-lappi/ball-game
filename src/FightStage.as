package 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Oskar
	 */
	public class FightStage extends FlxSprite 
	{
		[Embed(source = "Stage.png")]private var png:Class;
		private var clr:uint=0xff000000;
		private var oldclr:uint;
		private var clr2:uint = 0xffffffff;
		private var oldclr2:uint;
		public function FightStage(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			loadGraphic(png, false, false, 253, 46);
			scale.x = 7;
			scale.y = 8;
			width = scale.x * width;
			offset.x = -width / 2;
			offset.x += width / 16;
			x += offset.x;
			height = scale.y * height;
			offset.y = -height / 2;
			offset.y += height / 16;
			y += offset.y;
			replaceColor(0xffc7c7c7, 0xffdcb533);
			replaceColor(0xff000000, 0xff45ad45);
			replaceColor(0xfff7f7f7,0xff25dd77);
			
		}
		
		override public function update():void {
			/*
			oldclr = clr;
			oldclr2 = clr2;
			var p1:Number=Registry.guis.members[1].points-Registry.guis.members[0].points;
			var p2:Number = Registry.guis.members[0].points - Registry.guis.members[1].points;
			if (p2 < 0)
			p2 = 0;
			if (p1 < 0)
			p1 = 0;
			if (p1 > 16)
			p1 = 16;
			if (p2 > 16)
			p2 = 16;
			clr = 0xff000000+uint("0x" +( p1* 16 * 16*16*16*16).toString(16)) + uint("0x" +(p2 * 16).toString(16));
			replaceColor(oldclr, clr);
			replaceColor(oldclr2, clr2);
			*/
		}
	}

}