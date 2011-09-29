package de.peerweidner.rpgframework.view.circlemenu
{
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	
	import de.peerweidner.base.display.sprite.BaseSprite;
	import de.peerweidner.base.view.BaseView;
	import de.peerweidner.rpgframework.view.circlemenu.components.Circle;
	
	import flash.events.TouchEvent;
	
	public class CircleMenuView extends BaseView
	{
		private var holder : BaseSprite;
		
		public function CircleMenuView(id:String, defaultState:String="show")
		{
			super(id, defaultState);
		}
		
		/**
		 * Initializes required view components
		 */
		override public function init():void
		{
			holder = new BaseSprite();
			addChild(holder);
			
			var circle : Circle = new Circle();
			circle.x = 100;
			circle.y = 100;
			circle.alpha = .5;
			holder.addChild(circle);
			
			circle.addEventListener(TouchEvent.TOUCH_TAP, circleTapHandler);
		}
		
		/**
		 * Handles circle tap event
		 * will either fade in or out
		 */
		private function circleTapHandler(event:TouchEvent):void
		{
			// New alphy type is number so it can be a value bewteen 0 and 1
			var newAlpha : Number = .5;
			if((event.currentTarget as BaseSprite).alpha != 1)
			{
				newAlpha = 1;
			}
			
			// Alpha will be set according to new alpha value
			TweenMax.to(event.currentTarget, 0.7, {autoAlpha: newAlpha});
		}
	}
}