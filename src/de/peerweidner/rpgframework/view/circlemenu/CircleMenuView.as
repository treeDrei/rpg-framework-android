package de.peerweidner.rpgframework.view.circlemenu
{
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	
	import de.peerweidner.base.display.sprite.BaseSprite;
	import de.peerweidner.base.view.BaseView;
	import de.peerweidner.rpgframework.view.circlemenu.components.Circle;
	
	import flash.events.Event;
	import flash.events.TouchEvent;
	import flash.events.TransformGestureEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
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
			
			Multitouch.inputMode=MultitouchInputMode.TOUCH_POINT; 
			// Use this if touch points are enabled
			circle.addEventListener(TouchEvent.TOUCH_TAP, circleTapHandler);
			
			//Multitouch.inputMode = MultitouchInputMode.GESTURE;
			// Use if gestures are enabled
			//circle.addEventListener(TransformGestureEvent.GESTURE_SWIPE, circleSwypeHandler);
		}
		
		override protected function addedToStageHandler( e : Event ) :void
		{
			//stage.addEventListener(TransformGestureEvent.GESTURE_SWIPE, circleSwypeHandler);			
		}
		
		private function circleSwypeHandler(event:TransformGestureEvent):void
		{
			
			trace(event.offsetX + "/" + event.offsetY);
			var color : uint = 0xcccccc;;
			if(event.offsetX == 1)
			{
				color = 0xff0000;
			}
			else if(event.offsetX == -1)
			{
				color = 0x00ff00;
			}
			else if(event.offsetY == 1)
			{
				color =0x0000ff;
			}
			else if(event.offsetY == -1)
			{
				color = 0x000000;
			}
			
			TweenMax.to(event.currentTarget, 0.5, {tint:color});
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
			TweenMax.to(event.currentTarget, 0.7, {autoAlpha: newAlpha, scaleX:2, scaleY:2});
			
			Multitouch.inputMode = MultitouchInputMode.GESTURE;
			(event.currentTarget as Circle).addEventListener(TransformGestureEvent.GESTURE_SWIPE, circleSwypeHandler);
		}
	}
}