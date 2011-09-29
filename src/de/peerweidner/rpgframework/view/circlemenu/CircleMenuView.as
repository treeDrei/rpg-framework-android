package de.peerweidner.rpgframework.view.circlemenu
{
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	
	import de.peerweidner.base.display.sprite.BaseSprite;
	import de.peerweidner.base.view.BaseView;
	import de.peerweidner.rpgframework.view.circlemenu.components.Center;
	import de.peerweidner.rpgframework.view.circlemenu.components.Pedal;
	import de.peerweidner.rpgframework.view.circlemenu.components.Selectable;
	
	import flash.events.Event;
	import flash.events.TouchEvent;
	import flash.events.TransformGestureEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	public class CircleMenuView extends BaseView
	{
		private var holder : BaseSprite;
		private var selectionID : String;
		
		public function CircleMenuView(id:String, defaultState:String="show")
		{
			super(id, defaultState);
		}
		
		/**
		 * Initializes required view components
		 */
		override public function init():void
		{
			// Holder will hold all elements
			holder = new BaseSprite();
			addChild(holder);
			
			// Creates center
			createCenter();
			
			// Creats four pedals
			createPedal(100,100,0);
			createPedal(100,100,90);
			createPedal(100,100,180);
			createPedal(100,100,270);
			
			
			// Enables touch points
			Multitouch.inputMode=MultitouchInputMode.TOUCH_POINT; 
			
			
			//Multitouch.inputMode = MultitouchInputMode.GESTURE;
			// Use if gestures are enabled
			//circle.addEventListener(TransformGestureEvent.GESTURE_SWIPE, circleSwypeHandler);
		}
		
		/**
		 * Creates center menu elements
		 */
		private function createCenter() : void
		{
			// Create
			var circle : Center = new Center();
			// Position
			circle.x = 100;
			circle.y = 100;
			// Full visibility
			circle.alpha = 1;
			// Show
			holder.addChild(circle);
			
			// Initial state is small
			circle.scaleSmall();
			// Handles touch on cicle
			circle.addEventListener(TouchEvent.TOUCH_BEGIN, circleTouchBeginHandler);
			circle.addEventListener(TouchEvent.TOUCH_OVER, touchOverHandler);
		}
		
		/**
		 * Creates one of four pedal elements around center
		 */
		private function createPedal(pedX:Number, pedY:Number, rotation:Number = 0) : void
		{
			// Creates
			var pedal : Pedal = new Pedal();
			// Adds to display
			holder.addChild(pedal);
			// Adds event handling
			pedal.addEventListener(TouchEvent.TOUCH_OVER, touchOverHandler);
			// Position
			pedal.x = pedX;
			pedal.y = pedY;
			// Rotation in degrees
			pedal.rotation = rotation;
		}
		
		/**
		 * Handles touch roll over event
		 */
		private function touchOverHandler(event:TouchEvent):void
		{
			// Manipulate pedal here
			(event.currentTarget as Selectable).showSelection();
		}
		
		
		
		/**
		 * Handles circle touch begin event
		 * will scale big
		 */
		private function circleTouchBeginHandler(event:TouchEvent):void
		{
			(event.currentTarget as Center).scaleBig();
			
			/*
			// New alphy type is number so it can be a value bewteen 0 and 1
			var newAlpha : Number = .5;
			if((event.currentTarget as BaseSprite).alpha != 1)
			{
				newAlpha = 1;
			}
			
			// Alpha will be set according to new alpha value
			TweenMax.to(event.currentTarget, 0.7, {autoAlpha: newAlpha, scaleX:2, scaleY:2});
			
			Multitouch.inputMode = MultitouchInputMode.GESTURE;
			(event.currentTarget as Center).addEventListener(TransformGestureEvent.GESTURE_SWIPE, circleSwypeHandler);
			*/
		}
		
		// Only intresting if gestures are used
		/*
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
		*/
	}
}