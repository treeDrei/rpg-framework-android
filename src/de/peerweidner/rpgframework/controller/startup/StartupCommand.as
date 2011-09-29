package de.peerweidner.rpgframework.controller.startup
{
	import org.robotlegs.utilities.macro.SequenceCommand;
	
	public class StartupCommand extends SequenceCommand
	{
		override public function execute() : void
		{
			// Makes sure stage is ready to add views
			addCommand(InitializeStageCommand);
			// Adds timeline view
			addCommand(InitializeLayersCommand);
			// Adds circle menu view
			addCommand(InitializeCircleMenuCommand);
			
			// Executes added commands
			super.execute();
		}
	}
}