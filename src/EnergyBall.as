package 
{
	import org.flixel.FlxSprite;
		import org.flixel.FlxPoint;
		import org.flixel.FlxG;
		import org.flixel.FlxTileblock;
	
	/**
	 * ...
	 * @author Oskar
	 */
	public class EnergyBall extends FlxSprite 
	{
		[Embed(source = "EnergyBall.png")]private var ball:Class;
		public var clr:uint = 0xff000000;
		public var clr2:uint = 0xffffffff;
		private var oldclr2:uint;
		public var powered:Boolean = true;
		private var counter:Number = 500;
		public var fakeAngle:Number = 0;
		public var fakeAngleVel:Number = 0;
		public var fakeAngleAcc:Number = 0;
		private var fakeAngleVelMAX:Number = 233;
		private var fakeAngleAccMAX:Number = 97;
		
		
		private var oldclr:uint;
		private var focalPoint:FlxPoint = new FlxPoint;
		private var integral:FlxPoint = new FlxPoint;
		private var oldFocalPoint:FlxPoint = new FlxPoint;
		private var clrstr:String = "a"; 
		public var target:FlxSprite;
		public var rel1:Number = Registry.players.members[0].actualPower / 16 / 16;
		public var srlrel1:Number = 0; 
		public var rel2:Number = Registry.players.members[1].actualPower/16/16;
		public function EnergyBall(X:Number=0, Y:Number=0) 
		{
			FlxG.watch(this,"rel1");
						FlxG.watch(this,"srlrel1");
			
			target = new FlxSprite();
			target.makeGraphic(9, 9);
			super(X, Y);
			loadGraphic(ball,true,false,30,30);
			maxAngular = 500;
			maxVelocity = new FlxPoint(200, 200);
			var rel1:Number = Registry.players.members[0].intPower >>8;
			var rel2:Number = Registry.players.members[1].intPower >>8;
			x = (Registry.players.members[0].x * (.2+ rel2)  + Registry.players.members[1].x * (.2+ rel1) )/(.4+rel1+rel2);
			y = (Registry.players.members[0].y * (.2 + rel2) + Registry.players.members[1].y * (.2 + rel1) ) / (.4 + rel1 + rel2);
			acceleration.y = 1000;
			
			elasticity = .5;
			mass = 5;
			drag.x = 200;
			Registry.bgFX.add(target);
			
		}
		override public function update():void {
			
			
			
			
			//re1 & 2 are just values that represent the players influence between 0 and 1
			
			if (powered) {
				 rel1 = Registry.players.members[0].actualPower / 16 / 16;
				 srlrel1 = Registry.players.members[0].actualPower >> 8;
			 rel2 = Registry.players.members[1].actualPower/16/16;
				if(counter>100){
					oldFocalPoint = focalPoint;
					
					//
					if (rel1 + rel2 < .25&&rel1+rel2>.2) {
						rel1 += (.25-rel1-rel2)*rel1/(rel1+rel2);
						rel2 = .25 - rel1;
					}else if (rel1 + rel2 > .18 && rel1 + rel2 < .2) {
						rel1 += (.15-rel1-rel2)*rel1/(rel1+rel2);
						rel2 = .15 - rel1;
					}
					focalPoint.x = (Registry.players.members[0].x * (-.1+ rel2)  + Registry.players.members[1].x * (-.1 +rel1) )/(-.2+rel1+rel2)+25;//reference
					focalPoint.y = (Registry.players.members[0].y * ( -.1 + rel2) + Registry.players.members[1].y * ( -.1 + rel1) ) / ( -.2 + rel1 + rel2);
				
					integral.x += (rel1+rel2)*(focalPoint.x - x-15);//I part
					integral.y += (rel1+rel2)*(focalPoint.y - y-15);
	
					velocity.x =  (integral.x  + 2 * (focalPoint.x - x-15) -2 * (oldFocalPoint.x - focalPoint.x));// a PID-controller  /(3*(.1+Math.pow(Math.abs(Registry.players.members[0].x-Registry.players.members[1].x),.001)))
					velocity.y =  (integral.y + 2 * (focalPoint.y - y-15) - 2 * (oldFocalPoint.y - focalPoint.y));
			
			
					scale.x =1+ .5*(rel1+rel2+rel1/(rel2+.5)+ rel2/(rel1+.5));//get bigger with more influence,only scaling graphics
					scale.y = scale.x;
					
				} else
				counter++;
				
				//change color according to how much players influence the ball
				oldclr = clr;
				clr = 0xff002000 + uint("0x" + Registry.players.members[0].power.toString(16)) + uint("0x" + Registry.players.members[1].power.toString(16));
				oldclr2 = clr2;
				clr2 = 0xffffffff - clr + 0xff000000;
				//if(FlxG.
				//replaceColor(oldclr, clr );
				//replaceColor(oldclr2, clr2 );
				//spin if there is influence
				
				fakeAngleAcc = 1 + fakeAngleVel * (rel1  + rel2-2);
				
				
			}else if (!Registry.players.members[0].flickering && !Registry.players.members[1].flickering && !flickering) {
				velocity.x = 2 * (FlxG.width / 2 - x-15);
				powered = true;
				counter = 0;
				integral = new FlxPoint;
				
			}
			else { 
				fakeAngleAcc = -fakeAngleVel;//slow down and return to the center
				velocity.x = 2 * (FlxG.width / 2 - x - 15);
					velocity.y = FlxG.height-200-y;
				focalPoint.x = FlxG.width / 2-14;
				focalPoint.y = FlxG.height-30 ;
			}
			clrstr = "0x" + clr.toString(16);
		
			if (justTouched(FLOOR)&&overlaps(Registry.room)) {
			velocity.y = -Math.abs(velocity.y);
			}
			target.x = focalPoint.x - 2;
			target.y = focalPoint.y - 2;
		if (fakeAngleVel > fakeAngleVelMAX)
				fakeAngleVel = fakeAngleVelMAX;
			if (fakeAngleAcc > fakeAngleAccMAX)
				fakeAngleAcc = fakeAngleAccMAX;
				
			fakeAngleVel += fakeAngleAcc;
			fakeAngle+= fakeAngleVel;
			fakeAngle = fakeAngle % 16;
			frame = Math.round(fakeAngle);

		}
		
	}

}