package 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxText;
	import org.flixel.FlxTileblock;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Oskar
	 */
	public class Registry 
	{
		public static var bgFX:FlxGroup;
		public static var room:FlxGroup;
		public static var players:FlxGroup;
		public static var dangers:FlxGroup;
		public static var energyball:EnergyBall;
		public static var playerBox:FlxTileblock;
		public static var guis:FlxGroup;
		public static var mode:Mode;
		public static var winner:int;
		public static var modeGUI:FlxText;
		
		public function Registry() 
		{
			
		}
		
	}

}