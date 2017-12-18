package 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Oskar
	 */
	public class Player extends FlxSprite
	{
		public var power:uint =0;
		public var intPower:Number = 0;
		public var actualPower:Number = 0;
		public var concentration:Number = 100;
		private var conversionAr:Array;
		public var clr:uint;
		private var spawnPoint:FlxPoint;
		public var gui:GUI;
		public var concentrating:Boolean=false;
		public var head:FlxSprite;
		private var goalAngle:Number = 0;
		private var airAngle:Number = 0;
		[Embed(source = "Player1.png")]private var p1:Class;
		[Embed(source = "Player2.png")]private var p2:Class;
		[Embed(source = "Head.png")]private var head1:Class;
			[Embed(source = "Head2.png")]private var head2:Class;
		public function Player(X:Number,Y:Number,conversionAr:Array) 
		{
			spawnPoint = new FlxPoint(X, Y);
			this.conversionAr = conversionAr;
			var png:Class;
			super(X, Y);
			if (conversionAr[0] == 0) {
				head = new FlxSprite(X + 11, Y + 3, head2);
				loadGraphic(p1, true, true, 39, 80, false);
				clr=0xff3030ff;
			}
			else {
				head = new FlxSprite(X + 11, Y + 3, head1);
				loadGraphic(p2, true, true, 39, 80, false);
				clr = 0xffff3030;
			}
			
			acceleration.y =2000;
			drag.x = 600;
			maxVelocity.x = 400;
			
			scale.x = 2;
			scale.y = 2;
			offset.x = -width/2;
			offset.y=-height/2,
			width = width * 2;
			height = height * 2;
			
			head.scale.x = 2;
			head.scale.y = 2;
			head.offset.x = -head.width/2;
			head.offset.y=-head.height/2,
			head.width = head.width * 2;
			head.height = head.height * 2;
			head.origin.y = head.height/2;
			
		}
		
		private function powerCalc():void {
		
		}
		private function concentrationFX():void {
			head.origin.y = head.height / 2;
			//head.origin.x =width/2- Math.cos(angle * Math.PI / 180)*(height/2-head.height) ;
		
				var angleD:Number = (180 - Math.atan2((Registry.energyball.getMidpoint().x - head.getMidpoint().x) , (Registry.energyball.getMidpoint().y - head.getMidpoint().y)) * 180 / Math.PI - head.angle);
				if (angleD > 180)
				angleD -= 360;
				
				if (Math.abs(angleD) < 5&&actualPower>16*4){
				//	Registry.bgFX.add(new fadeFX(head.x, head.y, this));
					
				}
				
				head.angle += 0.2 * angleD;
				if (head.angle >0)
				facing = RIGHT;
				else
				facing = LEFT;
				angle = head.angle / 4;
		}
		override public function update():void {
				head.scale.x = 2;
			head.scale.y = 2;
			
			acceleration.y = 2000;
			if (velocity.y > 0)
			acceleration.y = 1800;
			//Calculating power
			if(intPower<80)
				intPower ++;
			else if (intPower>80)
				intPower -= 5;
				intPower-= Math.floor(.1*Math.abs(velocity.x)*Math.pow(intPower/16/16,2)) ;
				intPower-= .3*Math.floor(.1*(-velocity.y)*Math.pow(intPower/16/16,2)) ;
			if (intPower < 0)
				intPower = 0;
			if (intPower >= 16 * 16) 
				intPower = 16 * 16 - 1;
			actualPower = Math.floor(1000* intPower / (1000 + Math.sqrt((Math.pow(x - Registry.energyball.x, 2) + Math.pow(y - Registry.energyball.y, 2)))));
			if (actualPower >= 16 * 16)
				actualPower = 16 * 16 - 1;
			power = actualPower * conversionAr[0] * 16 * 16 * 16 * 16 + actualPower * conversionAr[1];
			if(concentration<200)
				concentration += 1;
			//done calculating power
			
			
			if(!Registry.energyball.powered) {
				velocity.x = spawnPoint.x - x;
			}
			if (y > FlxG.height + 230 || y < -30) {
				//Registry.energyball = new EnergyBall(Registry.energyball.x, Registry.energyball.y);
	
				Registry.energyball.powered = false;
				
				var p:Player = new Player(spawnPoint.x, spawnPoint.y, conversionAr);
				
				Registry.players.replace(this, p );
				Registry.players.replace(head, p.head);
				p.flicker(3);
				p.head.flicker(3);
				gui.points++;
				gui = null;
				
			}
			if (velocity.x > 0)
			facing = RIGHT;
			else if(velocity.x<0)
			facing = LEFT;
			
			if (concentrating) {
			concentrationFX();
			}else{
			head.origin.y = head.height-10 ;
			angle = 0.03*velocity.x/(Math.abs(velocity.y)+1);
			head.angle = angle;
			}
			if (Math.abs(velocity.x) < 5 && !concentrating&&touching===FLOOR) {
				frame = 0;
				goalAngle = 0;
			}
			else {
			
			frame = 1;
			
			}
			if (overlaps(Registry.room) && velocity.y > 0) {
				//velocity.y = -velocity.y+((FlxG.height-height)-y)*3

			}
			
			//head.scale.x += actualPower / 16 / 16;
			//head.scale.y = head.scale.x;
			
			head.offset.x = -(head.scale.x - 1) * head.width/5 ;
			head.offset.y = -(head.scale.y - 1) * head.height / 4;
			
		
			
		}
		
		
	}

}