public class TimeConversion {
    /**
     * Convert a duration in format M[M]:SS into seconds
   	 */
    public static Integer convertDurationToSeconds(String duration){
        String[] split = duration.split(':');
        Integer minutes = Integer.valueOf(split[0]);
        Integer seconds = Integer.valueOf(split[1]);
        return (minutes * 60) + seconds;
    }
}