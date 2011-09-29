package de.peerweidner.rpgframework.controller.startup
{
	import de.peerweidner.rpgframework.view.circlemenu.CircleMenuView;
	import de.peerweidner.rpgframework.view.layer.LayerView;
	import de.peerweidner.rpgframework.view.stage.event.StageViewEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class InitializeCircleMenuCommand extends Command
	{
		override public function execute():void
		{
			var view : CircleMenuView = new CircleMenuView("CircleMenu");
			dispatch(new StageViewEvent(StageViewEvent.CIRCLE_MENU_VIEW, view));
		}
	}
}