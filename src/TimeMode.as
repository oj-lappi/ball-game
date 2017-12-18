package 
{
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Oskar Lappi
	 */
	public class TimeMode implements Mode
	{
		private var time:uint
		
		public function TimeMode(time:uint) 
		{
			this.time = time;
			
			Registry.modeGUI = new FlxText(FlxG.width / 2 -time.toString().length*43/3, 260, time.toString().length*43);
			Registry.modeGUI.size = 60;
			
		}
			
		
		public function check():Boolean {
			time--;
			Registry.modeGUI.text = "" + Math.floor(time / FlxG.framerate);//TODO don't check every frame
			if (time == 0) {
				if (Registry.guis.members[0].points > Registry.guis.members[1].points)
				Registry.winner = 1;
				else
				Registry.winner = 2;
			return true;	
			}
			return false;
		}
		
	}

}