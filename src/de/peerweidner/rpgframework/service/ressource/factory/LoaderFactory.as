package de.peerweidner.rpgframework.service.ressource.factory
{
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.MP3Loader;
	import com.greensock.loading.SWFLoader;
	import com.greensock.loading.VideoLoader;
	import com.greensock.loading.core.LoaderCore;

	public class LoaderFactory
	{
		/**
		 * Create Loader 
		 * @param url
		 * @return LoaderCore
		 * 
		 */
		public static function createLoader(url : String) : LoaderCore
		{
			var loader : LoaderCore;
			// matches String after "." including "."
			var type : String = url.replace(/(.*)(\.\S{3})($|\?.*)/, '$2');
			switch (type)
			{
				case ".jpg":
				case ".png":
					loader = new ImageLoader(url, {name:url});
					break;
				case ".mp3":
					loader = new MP3Loader(url, {name:url, autoPlay:false});
					break;
				case ".flv":
				case ".f4v":
					loader = new VideoLoader(url, {name:url, autoPlay:false});
					break;
				case ".swf":
					loader = new SWFLoader(url, {name:url, autoPlay:false});
					break;
				case ".xml":
					loader = new XMLLoader(url, {name:url});
					break;
			}
			return loader;
		}
	}
}