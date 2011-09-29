package de.peerweidner.rpgframework.view.layer
{
	import de.peerweidner.base.view.BaseView;
	import de.peerweidner.rpgframework.view.layer.event.LayerViewEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class LayerViewMediator extends Mediator
	{
		[Inject]
		public var view : LayerView;
		
		public function LayerViewMediator()
		{
			super();
		}
		
		/**
		 * Registers view and context events
		 */
		override public function onRegister() : void
		{
			addContextListener(LayerViewEvent.HIDE, hideHandler);
			addContextListener(LayerViewEvent.SHOW, showHandler);
			addContextListener(LayerViewEvent.UPDATE, updateHandler);
		}
		
		/**
		 * Changes state to hide
		 */
		private function hideHandler( e : LayerViewEvent ):void
		{
			if(e.id == view.id)
			{
				view.state = BaseView.HIDE;
			}
		}
		
		/**
		 * Changes state to show
		 */
		private function showHandler( e : LayerViewEvent ):void
		{
			if(e.id == view.id)
			{
				view.state = BaseView.SHOW;
			}
		}
		
		/**
		 * Updates graphic on view
		 */
		private function updateHandler( e : LayerViewEvent ):void
		{
			if(e.id == view.id)
			{
				view.graphic = e.graphic;	
			}
		}		
	}
}