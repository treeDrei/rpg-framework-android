package de.peerweidner.rpgframework.context
{
	import de.peerweidner.rpgframework.controller.startup.StartupCommand;
	import de.peerweidner.rpgframework.service.ressource.IRessourceService;
	import de.peerweidner.rpgframework.service.ressource.RessourceService;
	import de.peerweidner.rpgframework.view.layer.LayerView;
	import de.peerweidner.rpgframework.view.layer.LayerViewMediator;
	import de.peerweidner.rpgframework.view.stage.StageView;
	import de.peerweidner.rpgframework.view.stage.StageViewMediator;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	
	public class RPGFrameworkContext extends Context
	{
		public function RPGFrameworkContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			// Commands execute changes in programm
			/** START ::: COMMANDS **/
			// Starts the application
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCommand, ContextEvent);
			/** END ::: COMMANDS **/
			
			
			// Shows current state of programm
			/** START ::: VIEWS **/
			// Stage view allows display manipulation
			mediatorMap.mapView(StageView, StageViewMediator);
			// Layers like foreground and background
			mediatorMap.mapView(LayerView, LayerViewMediator);
			/** END ::: VIEWS **/
			
			
			// Stores required data
			/** START ::: MODELS **/
			
			/** END ::: MODELS **/
			
			
			/** START ::: SERVICES **/
			injector.mapSingletonOf(IRessourceService, RessourceService);
			/** START ::: SERVICES **/
			
			super.startup();
		}
	}
}