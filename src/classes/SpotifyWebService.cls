global class SpotifyWebService {
    webservice static Boolean importTrackListing(String albumId){
     	Album__c album = SpotifyWebService.findAlbum(albumId);
        List<Song__c> songs = SpotifyHelper.getTrackListing(album);
		insert songs;
        return true;
    }
    
    public static Album__c findAlbum(String albumId){
        return [Select a.Name, a.Spotify_URI__c From Album__c a WHERE a.Id=:albumId LIMIT 1];
    }
}