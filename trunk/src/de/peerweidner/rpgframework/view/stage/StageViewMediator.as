package de.peerweidner.rpgframework.view.stage
{
	import org.robotlegs.mvcs.Mediator;
	
	public class StageViewMediator extends Mediator
	{
		[Inject]
		public var view : StageView;
		
		public function StageViewMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			
		}
	}
}