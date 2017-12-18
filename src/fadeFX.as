



package 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Oskar
	 */
	public class fadeFX extends FlxSprite 
	{
		private var player:Player;
		[Embed(source = "Head.png")]private var png:Class;
		public function fadeFX(X:Number, Y:Number,player:Player) 
		{
			
			super(X+10, Y+25);
			angle = player.head.angle;
			velocity.y = -1800*Math.cos(player.head.angle * Math.PI / 180);
			velocity.x = 1800 * Math.sin(player.head.angle * Math.PI / 180);
			alpha = 0.5;
			//makeGraphic(10, 10, player.clr);
			loadGraphic(png);
			
		}
		override public function update():void {
			if (overlaps(Registry.energyball))
			kill();
			alpha -= .01;
			
			//if (alpha == 0)
			//kill();
			//else
			scale.y += .4;
			scale.x += .4;
			
		}
	}

}