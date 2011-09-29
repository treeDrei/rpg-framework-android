package de.peerweidner.rpgframework.model.ressource
{
	import de.peerweidner.rpgframework.model.ressource.vo.RessourceVO;
	
	import flash.utils.Dictionary;
	
	import org.robotlegs.mvcs.Actor;
	
	public class RessourceModel extends Actor
	{
		public var ressources : Dictionary;
		
		public function RessourceModel()
		{
			super();
			ressources =  new Dictionary();
		}
		
		/**
		 * Returns ressource by id
		 */
		public function getRessource( id : String ) : RessourceVO
		{
			return ressources[id];
		}
		
		/**
		 * Adds a ressource to model
		 */
		public function addRessource( id : String, vo : RessourceVO ) : void
		{
			ressources[id] = vo;
		}
		
		/**
		 * Returns a list of missing resources
		 */
		public function getMissingRessources () : Vector.<RessourceVO>
		{
			var missing : Vector.<RessourceVO> = new Vector.<RessourceVO>();
			for each(var vo : RessourceVO in ressources)
			{
				if(!vo.loaded)
				{
					missing.push(vo);
				}
			}
			
			return missing;
		}
	}
}