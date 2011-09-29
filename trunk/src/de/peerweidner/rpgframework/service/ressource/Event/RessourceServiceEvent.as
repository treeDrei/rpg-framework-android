package de.peerweidner.rpgframework.service.ressource.Event
{
	import flash.events.Event;
	
	public class RessourceServiceEvent extends Event
	{
		public function RessourceServiceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}