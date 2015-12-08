@isTest
private class TestConvertDurationToSeconds {
    static void init(){}
   	static testMethod void testTimeConversion(){
        Album__c testAlbum = new Album__c(Name='Test Album');
        insert testAlbum;
		Song__c song = new Song__c(
        	Name='Test Song 1',
            Duration__c='1:20',
            Album__c=testAlbum.Id,
            Track_Number__c=1
        );
        insert song;
        Song__c testSong = [Select Duration_Seconds__c from Song__c where Id=:song.Id limit 1];        
        System.assertNotEquals(testSong.Id, null);
        System.assertEquals(80, testSong.Duration_Seconds__c);

    }
}