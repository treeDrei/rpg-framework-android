package de.peerweidner.rpgframework.view.stage
{
	import de.peerweidner.base.display.sprite.BaseSprite;
	import de.peerweidner.base.view.BaseView;
	
	public class StageView extends BaseView
	{
		private var circleMenuHolder : BaseSprite;
		private var _circleMenuView : BaseView;
		
		public function StageView(id:String, defaultState:String= BaseView.SHOW)
		{
			super(id, defaultState);
		}
		
		/**
		 * Initializes required view components
		 */
		override public function init() : void
		{
			circleMenuHolder = new BaseSprite();
			addChild(circleMenuHolder);
		}
		
		/**
		 * Adds circle menu to display
		 */
		public function set circleMenuView( view : BaseView ) : void
		{
			if(_circleMenuView != null)
			{
				circleMenuHolder.removeChild(_circleMenuView);
			}
			_circleMenuView = view;
			circleMenuHolder.addChild(_circleMenuView);
		}
	}
}