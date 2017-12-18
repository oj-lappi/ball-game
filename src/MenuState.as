package
{
	import org.flixel.*;
	import flash.display.StageDisplayState;
	public class MenuState extends FlxState
	{
		private var menu:Array;
		private var index:uint;
		
		override public function create():void
		{
			menu = new Array();
			menu.push(new FlxText(FlxG.width/2-15,FlxG.height/6,30,"Stock Mode"))
			menu.push(new FlxText(FlxG.width/2-15,FlxG.height/6*2,30,"Time Mode"))
			menu.push(new FlxText(FlxG.width/2-3-15,FlxG.height/6*3,35,"Health\n Mode"))
			menu.push(new FlxText(FlxG.width/2-28,FlxG.height/6*4,63,"Instructions"))
			menu.push(new FlxText(FlxG.width/2-19,FlxG.height/6*5,39,"Credits"))

			for each(var a:FlxText in menu) {
			add(a);	
			a.origin.y = a.height / 2;
			}
			FlxG.stage.displayState = StageDisplayState.FULL_SCREEN;
			var title:FlxText;
			title = new FlxText(0, 16, FlxG.width, "ESPERS BOWL");
			title.setFormat (null, 16, 0xFFFFFFFF, "center");
			add(title);
			
			var instructions:FlxText;
			instructions = new FlxText(0, FlxG.height - 32, FlxG.width, "Press Space To Play");
			instructions.setFormat (null, 8, 0xFFFFFFFF, "center");
			add(instructions);
 
		} // end function create
 
 
		override public function update():void
		{
			if (FlxG.keys.justPressed("UP")) {
				if(index>0)
				index--;
			}
			if (FlxG.keys.justPressed("DOWN")) {
				if (index < 4)
				index++;
			}
			for (var i:int = 0; i < 5; i++) {
				if (i == index)
				menu[i].scale.x += 4 - menu[i].scale.x<<.5;
				else
				(menu[i] as FlxText).scale.x+= 1 - menu[i].scale.x<<.5;
				menu[i].scale.y = menu[i].scale.x;
			}
			super.update(); // calls update on everything you added to the game loop
 
			if (FlxG.keys.justPressed("SPACE"))
			{
				switch(index) {
				case 0:
					Registry.mode = new StockMode(5);
					FlxG.switchState(new PlayState());
					break;
				case 1:
					Registry.mode= new TimeMode(120*FlxG.framerate)
					FlxG.switchState(new PlayState());
					break;
				case 2:
					//TODO these options + gui implementation of stock mode
					//FlxG.switchState(new PlayState);
				case 3:
					
				case 4:
					
				}
			}
 
		} // end function update
 
 
		public function MenuState()
		{
			super();
 
		}  // end function MenuState
 
	} // end class
}// end package 