package de.peerweidner.rpgframework.controller.startup
{
	import de.peerweidner.rpgframework.view.layer.LayerView;
	import de.peerweidner.rpgframework.view.stage.event.StageViewEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class InitializeLayersCommand extends Command
	{
		override public function execute():void
		{
			var backLayer : LayerView = new LayerView("Background");
			dispatch(new StageViewEvent(StageViewEvent.BACK_LAYER_VIEW, backLayer));
			
			var frontLayer : LayerView = new LayerView("Foreground");
			dispatch(new StageViewEvent(StageViewEvent.FRONT_LAYER_VIEW, frontLayer));
		}
	}
}