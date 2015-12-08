public class SpotifyHelper {
   public static List<Song__c> getTrackListing(Album__c album){
        //adding a comment here to test if the deply worked
        String albumId = SpotifyHelper.stripURI(album.Spotify_URI__c);
		HttpRequest req = SpotifyHelper.createTracksRequest(albumId);
        Http sender = new Http();
        HTTPResponse res = sender.send(req);
		Map<String, Object> resParsed = SpotifyHelper.unpackResponse(res.getBody());
		Object[] tracks = (Object[])resParsed.get('items');
        List<Song__c> songs = new List<Song__c>();
        for(Object t : tracks){
			Map<String, Object> m = (Map<String, Object>)t;
            String duration = SpotifyHelper.convertToTimecode((Integer)m.get('duration_ms'));
			songs.add(new Song__c(
                Name=(String)m.get('name'),
                Track_Number__c=(Integer)m.get('track_number'),
                Duration__c=duration,
                Album__c=album.Id,
                Spotify_URI__c = (String)m.get('uri')
            ));
        }		
		return songs;
    }
    
    private static HttpRequest createTracksRequest(String alId){
        String requestUrl = 'https://api.spotify.com/v1/albums/' + alId + '/tracks';
        return SpotifyHelper.createRequestFromUrl(requestUrl);
        
    }
    
    private static HttpRequest createAlbumRequest(String alId){
		String requestUrl = 'https://api.spotify.com/v1/albums/' + alId;
        return SpotifyHelper.createRequestFromUrl(requestUrl);
    }
    
    private static HttpRequest createRequestFromUrl(String url){
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        return req;
    }
    
    private static Map<String, Object> unpackResponse(String res){
        return (Map<String, Object>)JSON.deserializeUntyped(res);
    }
    
    public static String convertToTimecode(Integer dur){
        Integer sec = dur/1000;
        Integer min = sec/60;
        Integer seco = Math.mod(sec, 60);
        String minStr = (min < 10 ? '0' : '') + String.valueOf(min);
        String seconds = (seco < 10 ? '0' : '') + String.valueOf(seco);
        return min + ':' + seconds;
    }
    
    /**
     * returns the id of the object requested
     */
    private static String stripURI(String uri){
        List<String> pieces = uri.split(':');
        return pieces.get(pieces.size() - 1);
    }
}