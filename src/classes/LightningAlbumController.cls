public class LightningAlbumController {
	@AuraEnabled
    public static List<Album__c> getAlbums(Id genreId){
        if(genreId == null){
            return [Select Id, Name, Duration__c, Artist__r.Name From Album__c];    
        }
        
        Genre__c genre = [Select Id from Genre__c Where Id = :genreId limit 1];
        return [Select Id, Name, Duration__c, Artist__r.Name 
        From Album__c 
        Where (Id In (
            Select Album__c from GenreAlbum__c WHERE Genre__c = :genre.Id))
        ];
        
    }

    @AuraEnabled
    public static Album__c getAlbumFromId(Id albumId){

    	Album__c album = 
    		[ SELECT Id, Name, Duration__c, Artist__r.Name, Photo__r.skuid__Url__c From Album__c  Where Id = :albumId Limit 1];

    	return album;
    }
    @AuraEnabled
    public static Song__c[] getSongsForAlbum(Id albumId){
    	Song__c[] songs = [Select Name, Duration__c, Track_Number__c From Song__c Where Album__r.Id = :albumId Order By Track_Number__c ASC];
    	return songs;
    }

    @AuraEnabled
    public static Song__c deleteSong(Song__c song){
    	delete song;
    	return song;
    }

    @AuraEnabled
    public static Song__c createSong(Song__c song){
    	insert song;
    	return song;
    }

}