package de.peerweidner.rpgframework.controller.startup
{
	import de.peerweidner.rpgframework.view.stage.StageView;
	
	import flash.media.StageVideo;
	
	import org.robotlegs.mvcs.Command;
	
	public class InitializeStageCommand extends Command
	{
		/**
		 * Adds stage view to allow display manipulation
		 */
		override public function execute () : void
		{
			var stageView : StageView = new StageView("Stage");
			contextView.addChild(stageView);
		}
	}
}