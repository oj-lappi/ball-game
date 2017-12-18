package 
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	/**
	 * ...
	 * @author Oskar
	 */
	public class Controls 
	{
		
		public function Controls() 
		{
			
		}
		public function update():void {
				Registry.players.members[0].acceleration.x = 0;
				Registry.players.members[1].acceleration.x = 0;
				Registry.players.members[0].concentrating = false;
				Registry.players.members[1].concentrating=false;
			if (FlxG.keys.A) {
				Registry.players.members[0].acceleration.x = -800;
			}
			if (FlxG.keys.D) {
				Registry.players.members[0].acceleration.x = 800;
			}
			if (FlxG.keys.W && (Registry.players.members[0].touching == FlxObject.FLOOR )) {
				Registry.players.members[0].velocity.y = -1000;
			}
			if (FlxG.keys.S) {
				if (Registry.players.members[0].concentration > 2){
				Registry.players.members[0].concentration-=3;
				Registry.players.members[0].intPower+=Registry.players.members[0].concentration/3+4;
				}
				Registry.players.members[0].concentrating = true;	
				//Registry.players.members[0].velocity.x =	0.9*Registry.players.members[0].velocity.x ;
			}
			
			if (FlxG.keys.LEFT) {
				Registry.players.members[1].acceleration.x = -800;
			}
			if (FlxG.keys.RIGHT) {
				Registry.players.members[1].acceleration.x = 800;
			}
			if (FlxG.keys.UP&&(Registry.players.members[1].touching==FlxObject.FLOOR)) {
				Registry.players.members[1].velocity.y = -1000;
			}
			if (FlxG.keys.DOWN) {
				if (Registry.players.members[1].concentration > 2){
					Registry.players.members[1].concentration -= 3;
					Registry.players.members[1].intPower += Registry.players.members[1].concentration / 3+4;
					
				}
				//Registry.players.members[1].velocity.x =0.9*Registry.players.members[1].velocity.x ;
					Registry.players.members[1].concentrating=true;
			}
		}
		
	}

}