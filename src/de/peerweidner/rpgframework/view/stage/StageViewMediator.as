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
		}
		
		/**
		 * Handles new front layer view
		 */
		private function frontLayerViewHandler( e : StageViewEvent ):void
		{
			// TODO Auto Generated method stub
			
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