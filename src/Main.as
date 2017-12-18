package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.flixel.FlxGame;
	import flash.system.Capabilities;
	
	/**
	 * ...
	 * @author Oskar
	 */
	public class Main extends FlxGame
	{
		
		public function Main() 
		{
			super(Capabilities.screenResolutionX, Capabilities.screenResolutionY, MenuState, 1);
			forceDebugger = true;
		}
		
		
		
	}
	
}