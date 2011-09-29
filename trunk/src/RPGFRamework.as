package
{
	import de.peerweidner.rpgframework.context.RPGFrameworkContext;
	import de.peerweidner.rpgframework.view.circlemenu.components.Circle;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
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