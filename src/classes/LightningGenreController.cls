public with sharing class LightningGenreController {
	
	@AuraEnabled
	public static List<Genre__c> getGenres(){
		return [Select Name, Id From Genre__c];
	}
}