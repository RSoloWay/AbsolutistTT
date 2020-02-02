package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class AbsolutistTT extends Sprite
	{
		public function AbsolutistTT()
		{
			
			[Embed(source="landing.mp3")]
			var AudioLand: Class;
			var landSound: Sound = new AudioLand();
			[Embed(source="fly.mp3")]
			var AudioFly: Class;
			var flySound: Sound = new AudioFly();
			
			var background: Back = new Back();
			var ironManSit:IronManSit = new IronManSit();
			var ironManFly:IronManFly = new IronManFly();
			var soundChn: SoundChannel;
			
			background.x = stage.stageWidth / 2;
			background.y = stage.stageHeight / 2;
			background.width = stage.stageWidth * 1.7777777778;
			background.height = stage.stageHeight;
			ironManSit.x = stage.stageWidth / 2;
			ironManSit.y = stage.stageHeight / 2;
			ironManSit.width = 90;
			ironManSit.height = 90;
			ironManFly.x = stage.stageWidth / 2;
			ironManFly.y = stage.stageHeight / 2;
			ironManFly.width = 180;
			ironManFly.height = 180;
			
			stage.addChild(background);
			stage.addChild(ironManSit);
			
			ironManSit.addEventListener(MouseEvent.MOUSE_DOWN, toBallUp);
			stage.addEventListener(MouseEvent.MOUSE_UP, toBallDown);
			
			function toBallUp(e:MouseEvent):void
			{
				stage.removeChild(ironManSit);
				stage.addChild(ironManFly);
				ironManFly.startDrag();
				soundChn = flySound.play();
			}
			
			function toBallDown(e: MouseEvent):void
			{
				ironManFly.stopDrag();
				stage.removeChild(ironManFly);
				stage.addChild(ironManSit);
				ironManFly.x = stage.stageWidth / 2;
				ironManFly.y = stage.stageHeight / 2;
				
				soundChn.stop();
				landSound.play();
			}
			
		}
	}
}