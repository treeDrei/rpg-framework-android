package de.peerweidner.rpgframework.model.ressource.vo
{
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.core.LoaderCore;

	public class RessourceVO
	{
		private var _id : String;
		private var _loader : LoaderCore;
		private var _url : String;
		
		public function RessourceVO( id : String, url : String )
		{
			_id = id;
			_url = url;
		}

		/**
		 * Returns loader data id
		 */
		public function get id():String
		{
			return _id;
		}

		/**
		 * Returns loader 
		 */
		public function get loader():LoaderCore
		{
			return _loader;
		}
		
		/**
		 * Shows wether this ressource has been loaded
		 */
		public function get loaded () : Boolean
		{
			if(_loader != null)
			{
				return (_loader.content != null);
			}
			
			return false;
		}
		
		/**
		 * Sets the loader
		 */
		public function set loader(value:LoaderCore):void
		{
			_loader = value;
		}
		
		/**
		 * Path to loadable item
		 */
		public function get url():String
		{
			return _url;
		}


	}
}