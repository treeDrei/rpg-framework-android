package de.peerweidner.rpgframework.view.circlemenu
{
	import de.peerweidner.base.display.sprite.BaseSprite;
	import de.peerweidner.base.view.BaseView;
	import de.peerweidner.rpgframework.view.circlemenu.components.Circle;
	
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
			
			var circle = new Circle();
			holder.addChild(circle);
		}
	}
}