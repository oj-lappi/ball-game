package 
{
	/**
	 * ...
	 * @author Oskar Lappi
	 */
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import org.flixel.FlxState;
	import org.flixel.FlxG;
	public class EndState extends FlxState
	{
		private var timer:int = 0;
		private var clr:uint = 0xffffffff;
		private var r:uint;
		private var g:uint;
		private var b:uint;
		public function EndState() 
		{
			
		}
		override public function create(): void {
			FlxG.bgColor = 0xff000000;
			
			
			add(new FlxText(FlxG.width / 2, FlxG.height / 2, 40, "Player " + Registry.winner + " wins"));
			members[0].origin.y = 10;
			members[0].origin.x = 20;
			members[0].alpha = .9;
			
			
			add(new FlxSprite(0, 0));
			members[1].makeGraphic(FlxG.width, FlxG.height, 0);
			add(new FlxText(FlxG.width / 2, FlxG.height / 2, 40, "Player " + Registry.winner + " wins"));
			members[2].origin = members[0].origin;
		}
		
		
		
		
		override public function update():void {
			timer++;
			
			members[0].scale.y =  Math.sin(timer / 400 * Math.PI)*15*(1+Math.sin(timer/100000*Math.PI)*.2);
			members[0].scale.x = members[0].scale.y;
			var c:uint =Math.floor(((Math.cos(timer * Math.PI /1200) + 1) / 2 * 130+90)*Math.pow(16,4))+ Math.floor(((Math.sin(timer * Math.PI /1200) + 1) / 2 *130+120)*Math.pow(16,2)) + Math.floor((Math.sin((timer * Math.PI +Math.PI)/1200) + 1) / 2 * 130+120);
			(members[0] as FlxText).color = c;
			members[0].angle = timer;
			(members[1] as FlxSprite).stamp(members[0], members[0].x, members[0].y);
			members[2].scale = members[0].scale;
			members[2].angle = members[0].angle;
			if (FlxG.keys.SPACE) {
			FlxG.switchState(new MenuState);	
			
			}
		}
	}

}