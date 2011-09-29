package
{
	import de.peerweidner.rpgframework.context.RPGFrameworkContext;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	public class RPGFRamework extends Sprite
	{
		public function RPGFRamework()
		{
			super();
			
			// unterstützt autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			
			var context:RPGFrameworkContext = new RPGFrameworkContext(this);
		}
	}
}