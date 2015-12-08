@isTest
public class TestTimeConversion {
    static testMethod void testConvertDurationToSeconds(){
        System.assertEquals(80, TimeConversion.convertDurationToSeconds('1:20'));
    }
}