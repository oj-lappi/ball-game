package 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxText;
	import org.flixel.FlxTileblock;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Oskar
	 */
	
	public class GUI extends FlxGroup
	{
		[Embed(source = "BrainBig.png")]private var brainPNG:Class;
		private var player:Player;
		private var concentration:FlxSprite;
		private var power:FlxSprite;
		private var bg:FlxSprite;
		private var emptyStamp:FlxSprite;
		private var which:int;
		private var pointstext:FlxText;
		public var points:uint = 0;
		private var bottomLayer:FlxSprite;
		private var upperLayer:FlxSprite;
		public function GUI(X:Number, Y:Number, which:int) 
		
		{
			this.which = which;
			concentration = new FlxSprite();
			power = new FlxSprite();
			bg = new FlxSprite(X,Y);
			bg.loadGraphic(brainPNG, false, true, 210, 178, true);
			power.loadGraphic(brainPNG, false, true, 210, 178, true);
			concentration.loadGraphic(brainPNG, false, true, 210, 178, true);
			bottomLayer = new FlxSprite(X,Y);
			upperLayer = new FlxSprite(X, Y);
			bottomLayer.makeGraphic(210, 178, 0,true);
			upperLayer.makeGraphic(210, 178, 0,true);
			
			pointstext = new FlxText(X +5, Y + 120, 10);
			emptyStamp = new FlxSprite();
			emptyStamp.makeGraphic(210, 178, 0x00000000);
			add(bg);
			add(upperLayer);
			add(bottomLayer);
			add(pointstext);
		
			
			
			
			concentration.replaceColor(0xfff8ec70,Registry.players.members[which].clr/2);
			power.replaceColor(0xfff8ec70,Registry.players.members[which].clr);
			
		

			for each(var a:FlxSprite in members) {
				a.scrollFactor = new FlxPoint;
				
				
			}
			if (which == 0) {
				power.facing = FlxObject.LEFT;
				concentration.facing = FlxObject.LEFT;
				bg.facing = FlxObject.LEFT;
				
			}
				
				
			pointstext.scale.x = 4;
			pointstext.scale.y = 4;
			
		}
		override public function update():void {
			Registry.players.members[which].gui = this;
			bottomLayer.fill(0);
			upperLayer.fill(0);
			
			
			var y1:Number = -(200-(Registry.players.members[which] as Player).concentration) / 200 * 178;
			var y2:Number =  -(250-(Registry.players.members[which] as Player).actualPower )/ 250 * 178;
			bottomLayer.stamp(concentration, 0, y1);
			
			upperLayer.stamp(power, 0,y2);
			bottomLayer.y = bg.y - y1;
			upperLayer.y = bg.y - y2;
			pointstext.text = "" + points;
			
		}
	
		
	}

}