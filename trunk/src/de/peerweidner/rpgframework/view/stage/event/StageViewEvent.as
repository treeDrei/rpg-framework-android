package de.peerweidner.rpgframework.view.stage.event
{
	import de.peerweidner.base.view.BaseView;
	
	import flash.events.Event;
	
	public class StageViewEvent extends Event
	{
		public static const FRONT_LAYER_VIEW : String = "StageViewEvent.FRONT_LAYER_VIEW";
		public static const BACK_LAYER_VIEW : String = "StageViewEvent.BACK_LAYER_VIEW";
		
		public var view : BaseView;
		
		public function StageViewEvent(type:String, view : BaseView, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.view = view;
		}
	}
}