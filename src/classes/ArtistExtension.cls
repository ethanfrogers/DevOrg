public class ArtistExtension {
	private final Artist__c artist;
    
    public ArtistExtension(ApexPages.StandardController stdController) {
        this.artist = (Artist__c)stdController.getRecord();
    }
    
    public Integer getAlbumCount(){
        Id artId = this.artist.Id;
		return database.countQuery('select count() from Album__c where Album__c.Artist__r.Id = :artId');
    }

}