package 
{
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	/**
	 * ...
	 * @author satetsu888
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// entry point
			
			// トランプの準備
			var allCards:Cards = new Cards().createCards();
			var allCardSpots:Array;
			
			var suffler:Suffler = new Suffler(allCards, stage);
			// トランプを置く場所の準備
			allCardSpots = suffler.setCardSpot();
			allCards.setSpots(allCardSpots);
			
			allCards = suffler.initShffle();
			
			//重ね順を気にしながら配置
			var i:int;
			for (i = 0; i < allCardSpots.length; i++) {
				stage.addChild(allCardSpots[i]);
			}
			for (i = 0; i < allCards.length; i++ ) {
				stage.addChild(allCards[i]);
			}
			
			// new to AIR? please read *carefully* the readme.txt files!
		}
		
		private function deactivate(e:Event):void 
		{
			// auto-close
			//NativeApplication.nativeApplication.exit();
		}
		
	}
	
}