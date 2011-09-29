package de.peerweidner.rpgframework.view.circlemenu.components
{
	import de.peerweidner.base.display.sprite.BaseSprite;
	
	public class Selectable extends BaseSprite
	{
		public var id : String;
		
		public function Selectable(id : String = "")
		{
			super();
			this. id = id;
		}
		
		/**
		 * Shows selection
		 */
		public function showSelection():void
		{
			// has to be overritten
		}
	}
}