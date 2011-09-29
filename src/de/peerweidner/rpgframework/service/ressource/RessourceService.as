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
		public 
		
		public function RessourceService()
		{
			super();
		}
		
		/**
		 * Load required ressources
		 */
		public function load() : void
		{
			// Loads missing ressources
			loadRessources(ressourceModel.getMissingRessources());
		}
		
		/**
		 * Load Items
		 *
		 * @param queueId String
		 * @param resources Array.<ResourceVO>
		 * @return LoaderMax
		 *
		 */
		public function loadRessources(queueId : String, resources : Vector.<RessourceVO>) : LoaderMax
		{			
			var queue : LoaderMax = new LoaderMax({name:queueId, onProgress:itemsLoaderProgressHandler, onComplete:itemsLoaderCompleteHandler, onError:itemsLoaderErrorHandler, auditSize:false});
			var i : int = resources.length;
			while (--i >= 0)
			{
				// Check wether this item has already been loeaded
				if(resources[i].loaded)
				{
					queue.append(createLoader(resources[i], false).loader);	
					}					
				}
			}
			queue.load();
			return queue;
		}
		
		/**
		 * Creats a loader for ressource vo
		 */
		private function createLoader(ressource : RessourceVO, autoLoad : Boolean = true) : RessourceVO
		{
			ressource.loader = LoaderFactory.createLoader(ressource.url);
			ressource.loader.addEventListener(LoaderEvent.ERROR, itemLoaderErrorHandler, false, 0, true);
			ressource.loader.addEventListener(LoaderEvent.PROGRESS, itemLoaderProgressHandler, false, 0, true);
			ressource.loader.addEventListener(LoaderEvent.COMPLETE, itemLoaderCompleteHandler, false, 0, true);
			
			if (autoLoad)
			{
				ressource.loader.load();
			}
			
			return ressource;
		}
		
		/**
		 *  Item loader error handler
		 */
		private function itemLoaderErrorHandler(event : LoaderEvent) : void
		{
			var ressource : RessourceVO = res  ((event.target as LoaderCore).name);
			//dispatch(new ResourceServiceItemEvent(ResourceServiceItemEvent.ERROR, resource.id, resource.type, (event.target as LoaderCore).progress));
		}
		
		/**
		 * Item loader complete handler
		 */
		private function itemLoaderProgressHandler(event : LoaderEvent) : void
		{
			var ressource : RessourceVO = getLoader((event.target as LoaderCore).name);
			//dispatch(new ResourceServiceItemEvent(ResourceServiceItemEvent.PROGRESS, resource.id, resource.type, (event.target as LoaderCore).progress));
		}
		
		/**
		 * Handles load complete
		 */
		private function itemLoaderCompleteHandler(event : LoaderEvent) : void
		{
			var ressource : RessourceVO = getLoader((event.target as LoaderCore).name);
			//dispatch(new ResourceServiceItemEvent(ResourceServiceItemEvent.COMPLETE, resource.id, resource.type, (event.target as LoaderCore).progress));
		}
		
		/**
		 * Items Loader Error Handler
		 *  
		 * @param event
		 * 
		 */
		private function itemsLoaderErrorHandler(event : LoaderEvent) : void
		{
			dispatch(new ResourceServiceItemsEvent(ResourceServiceItemsEvent.ERROR, (event.target as LoaderMax).name, (event.target as LoaderMax).progress));
		}
		
		/**
		 * Items Loader Complete Handler
		 * 
		 * @param event
		 * 
		 */
		private function itemsLoaderCompleteHandler(event : LoaderEvent) : void
		{
			dispatch(new ResourceServiceItemsEvent(ResourceServiceItemsEvent.COMPLETE, (event.target as LoaderMax).name, (event.target as LoaderMax).progress));
		}
		
		/**
		 * Items Loader Progress Handler
		 * 
		 * @param event
		 * 
		 */
		private function itemsLoaderProgressHandler(event : LoaderEvent) : void
		{
			dispatch(new ResourceServiceItemsEvent(ResourceServiceItemsEvent.PROGRESS, (event.target as LoaderMax).name, (event.target as LoaderMax).progress));
		}
		
		/**
		 * Get laoder
		 *
		 * @param url
		 * @return
		 *
		 */
		private function getLoader(url : String) : ResourceVO
		{
			return _resources[url];
		}
	}
}