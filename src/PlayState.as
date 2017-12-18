package 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTileblock;
	import org.flixel.FlxG;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.system.Capabilities;
	import org.flixel.FlxCamera;
	/**
	 * ...
	 * @author Oskar
	 */
	public class PlayState extends FlxState
	{
		private var controls:Controls = new Controls;
		
		public function PlayState() 
		{
		
		}
		override public function create():void {
			Registry.players = new FlxGroup;
			
			Registry.room = new FlxGroup;
			Registry.bgFX = new FlxGroup;
			Registry.playerBox = new FlxTileblock(0, 0, FlxG.width, FlxG.height)
			Registry.guis = new FlxGroup;
			
			add(Registry.bgFX);
			add(Registry.room);
			add(Registry.players);
		
			
			Registry.players.add(new Player(80,FlxG.height-400,new Array(1,0)));
			Registry.players.add(new Player(FlxG.width - 160, FlxG.height - 400, new Array(0, 1)));
			Registry.players.add(Registry.players.members[0].head);
			Registry.players.add(Registry.players.members[1].head);
		/*	Registry.room.add(new FlxTileblock(0, 0, FlxG.width, 100));
			Registry.room.add(new FlxTileblock(-100, 0, 100, FlxG.height));
			Registry.room.add(new FlxTileblock(FlxG.width - 1, 0, 100, FlxG.height));
			Registry.room.add(new FlxTileblock(0, FlxG.height - 3, FlxG.width, 100));
			*/
			Registry.room.add(new FightStage(FlxG.width / 2 - 126, FlxG.height ));
			
			FlxG.worldBounds.make( -100, -100, FlxG.width + 200, FlxG.height + 200);
			
			Registry.room.setAll("immovable", true); 
			Registry.energyball = new EnergyBall(100,100);
			add(Registry.energyball);
			Registry.guis.add(new GUI(10, 10, 0));
			Registry.guis.add(new GUI(FlxG.width - 220, 10, 1));
			
			
			
			add(Registry.modeGUI);
			add(Registry.dangers);
			add(Registry.guis);
			
			FlxG.bgColor = 0xff74a5d7;
			
			FlxG.camera.follow(Registry.playerBox);
		
		
			}
			override public function update():void {
				
				
				FlxG.collide(Registry.players, Registry.room);
				controls.update();
				super.update();
				if (Registry.energyball.powered){
				FlxG.collide(Registry.players, Registry.energyball);
				FlxG.collide(Registry.room, Registry.energyball);
				}
				FlxG.collide(Registry.players, Registry.players);
				
				Registry.playerBox.x = Registry.players.members[0].x > Registry.players.members[1].x?Registry.players.members[1].x:Registry.players.members[0].x;
	
				Registry.playerBox.y = Registry.players.members[0].y > Registry.players.members[1].y?Registry.players.members[1].y:Registry.players.members[0].y;
				Registry.playerBox.width = Math.abs(Registry.players.members[0].x - Registry.players.members[1].x)+80;
				
				Registry.playerBox.height = Math.abs(Registry.players.members[0].y - Registry.players.members[1].y);
				//if (Registry.playerBox.width > FlxG.width)
				//FlxG.camera.zoom = FlxG.width / Registry.playerBox.width;
				
				Registry.players.members[0].head.x = Registry.players.members[0].x + 22;
				Registry.players.members[0].head.y = Registry.players.members[0].y + 32;
				Registry.players.members[1].head.x = Registry.players.members[1].x + 22;
				Registry.players.members[1].head.y = Registry.players.members[1].y + 32;
				
				if (Registry.mode.check()) {
					FlxG.switchState(new EndState());
				}
				
			}
		
	}

}