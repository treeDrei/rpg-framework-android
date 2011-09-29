package de.peerweidner.rpgframework.view.circlemenu
{
	import org.robotlegs.mvcs.Mediator;
	
	public class CircleMenuViewMediator extends Mediator
	{
		[Inject]
		public var view : CircleMenuView;
		
		public function CircleMenuViewMediator()
		{
			super();
		}
	}
}