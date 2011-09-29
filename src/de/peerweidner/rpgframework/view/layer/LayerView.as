package de.peerweidner.rpgframework.view.layer
{
	import de.peerweidner.base.view.BaseView;
	
	import flash.display.DisplayObject;
	
	public class LayerView extends BaseView
	{
		private var _graphic : DisplayObject;
		
		public function LayerView(id:String, defaultState:String="show")
		{
			super(id, defaultState);
		}
		
		/**
		 * Updates graphic on view
		 */
		public function set graphic (val : DisplayObject) : void
		{
			if(_graphic != val && val != null)
			{
				// Removes graphic if exists
				removeChild(_graphic);
				// Update reference
				_graphic = val;
				// Add graphic to view
				addChild(_graphic);
			}
		}
	}
}