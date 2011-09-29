package de.peerweidner.rpgframework.view.circlemenu.components
{
	import com.greensock.TweenMax;
	
	import de.peerweidner.base.display.sprite.BaseSprite;
	
	public class Center extends Selectable
	{
		private var circle : CircleCenter;
		
		public function Center(id : String = "")
		{
			super(id);
			
			/*
			this.graphics.beginFill(0xff3311);
			this.graphics.drawCircle(0,0, 20);
			this.graphics.endFill();
			*/
			
			circle = new CircleCenter();
			addChild(circle);
		}
		
		/**
		 * Scales to full size
		 */
		public function scaleBig() : void
		{
			TweenMax.to(circle, 0.5, {scaleX:1, scaleY:1})
		}
		
		/**
		 * Scales to small size
		 */
		public function scaleSmall() : void
		{
			TweenMax.to(circle, 0.5, {scaleX:.5, scaleY:.5})
		}
	}
}