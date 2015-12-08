trigger ConvertDurationToSeconds on Song__c (before update, before insert) {
    for(Song__c song : Trigger.New){
        if(song.Duration__c != null){
            Integer converted = TimeConversion.convertDurationToSeconds(song.Duration__c);
        	song.Duration_Seconds__c = converted;
        }
    }
}