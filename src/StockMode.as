package 
{
	/**
	 * ...
	 * @author Oskar Lappi
	 */
	public class StockMode implements Mode 
	{
		private var stocks:int;
		public function StockMode(stocks:int) 
		{
			this.stocks = stocks;
			
		}
		
		/* INTERFACE Mode */
		
		public function check():Boolean 
		{
			if (Registry.guis.members[0].points >= stocks) {
				Registry.winner = 1;
				return true;
			}
			if (Registry.guis.members[1].points >= stocks) {
				Registry.winner = 2
				return true;
			}
			return false;
			
		}
		
	}

}