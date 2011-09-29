package de.peerweidner.rpgframework.view.circlemenu.components
{
	import com.greensock.TweenMax;
	
	import de.peerweidner.base.display.sprite.BaseSprite;
	
	public class Pedal extends Selectable
	{
		private var pedal : CirclePedal;
		
		public function Pedal(id : String = "")
		{
			super(id);
			pedal = new CirclePedal();
			addChild(pedal);
		}
		
		/**
		 * Shows selection by scaling big
		 */
		override public function showSelection():void
		{
			var selectionAnimationTime : Number = 0.3;
			TweenMax.to(pedal, selectionAnimationTime, {scaleX:1, scaleY:1, x:0, y:0})
		}
	}
}