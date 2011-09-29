package de.peerweidner.rpgframework.service.ressource
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.LoaderMax;
	
	import de.peerweidner.rpgframework.model.ressource.RessourceModel;
	import de.peerweidner.rpgframework.model.ressource.vo.RessourceVO;
	import de.peerweidner.rpgframework.service.ressource.factory.LoaderFactory;
	
	import org.robotlegs.mvcs.Actor;
	
	public class RessourceService extends Actor implements IRessourceService
	{
		[Inject]
		public var ressourceModel : RessourceModel;
		
		public function RessourceService()
		{
			super();
		}
		
		/**
		 * Load required ressources
		 * @param loadID is a unique id for load progress
		 */
		public function load(loadID : String) : void
		{
			// Loads missing ressources
			loadRessources(,ressourceModel.getMissingRessources());
		}
		
		/**
		 * Loads a list of ressourced
		 */
		public function loadRessources(loadID : String, ressources : Vector.<RessourceVO>) : void
		{			
			var queue : LoaderMax = new LoaderMax({name:loadID, onProgress:itemsLoaderProgressHandler, onComplete:itemsLoaderCompleteHandler, onError:itemsLoaderErrorHandler, auditSize:false});
			for(var i : int = 0; i < ressources.length; i++)
			{
				// Check wether this ressource has already been loeaded
				if(ressources[i].loaded)
				{
					ressources[i].loader = LoaderFactory.createLoader(ressources[i].url);
					queue.append(ressources[i].loader);					
				}
			}
			queue.load();
		}
		
		
		/**
		 * Ressource Loader Error Handler
		 */
		private function itemsLoaderErrorHandler(event : LoaderEvent) : void
		{
			//dispatch(new ResourceServiceItemsEvent(ResourceServiceItemsEvent.ERROR, (event.target as LoaderMax).name, (event.target as LoaderMax).progress));
		}
		
		/**
		 * Ressource Loader Complete Handler
		 */
		private function itemsLoaderCompleteHandler(event : LoaderEvent) : void
		{
			//dispatch(new ResourceServiceItemsEvent(ResourceServiceItemsEvent.COMPLETE, (event.target as LoaderMax).name, (event.target as LoaderMax).progress));
		}
		
		/**
		 * Ressource Loader Progress Handler
		 */
		private function itemsLoaderProgressHandler(event : LoaderEvent) : void
		{
			//dispatch(new ResourceServiceItemsEvent(ResourceServiceItemsEvent.PROGRESS, (event.target as LoaderMax).name, (event.target as LoaderMax).progress));
		}
	}
}