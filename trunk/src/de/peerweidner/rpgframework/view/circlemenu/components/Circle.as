package de.peerweidner.rpgframework.view.circlemenu.components
{
	import de.peerweidner.base.display.sprite.BaseSprite;
	
	public class Circle extends BaseSprite
	{
		public function Circle()
		{
			super();
			
			this.graphics.beginFill(0xff3311);
			this.graphics.drawCircle(0,0, 20);
			this.graphics.endFill();
			
		}
	}
}