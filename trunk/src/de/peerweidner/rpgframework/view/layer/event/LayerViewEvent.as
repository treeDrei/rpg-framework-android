package de.peerweidner.rpgframework.view.layer.event
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	public class LayerViewEvent extends Event
	{
		public static const SHOW : String = "LayerViewEvent.SHOW";
		public static const HIDE : String = "LayerViewEvent.HIDE";
		public static const UPDATE : String = "LayerViewEvent.UPDTAE";
		
		public var graphic : DisplayObject;
		public var id : String;
		
		public function LayerViewEvent(type:String, id : String, graphic : DisplayObject = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.graphic = graphic;
			this.id = id;
		}
	}
}