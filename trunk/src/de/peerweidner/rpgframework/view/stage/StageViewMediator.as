package de.peerweidner.rpgframework.view.stage
{
	import de.peerweidner.rpgframework.view.stage.event.StageViewEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class StageViewMediator extends Mediator
	{
		[Inject]
		public var view : StageView;
		
		public function StageViewMediator()
		{
			super();
		}
		
		/**
		 * Registers view and context events
		 */
		override public function onRegister():void
		{
			addContextListener(StageViewEvent.BACK_LAYER_VIEW, backLayerViewHandler);
			addContextListener(StageViewEvent.FRONT_LAYER_VIEW, frontLayerViewHandler);
			addContextListener(StageViewEvent.CIRCLE_MENU_VIEW, circleMenuViewHandler)
		}
		
		/**
		 * Handles circle menu add request
		 */
		private function circleMenuViewHandler( e : StageViewEvent ):void
		{
			view.circleMenuView = e.view;
		}
		
		/**
		 * Handles new front layer view
		 */
		private function frontLayerViewHandler( e : StageViewEvent ):void
		{
			
		}
		
		/**
		 * Handles new back layer view
		 */
		private function backLayerViewHandler( e : StageViewEvent ):void
		{
			// TODO Auto Generated method stub
			
		}
	}
}