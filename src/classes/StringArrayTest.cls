public class StringArrayTest {
    public static List<String> generateStringArray(Integer len){
		String[] li = new List<String>();
        for(Integer i = 0; i < len; i++){
            li.add('Test ' + i);
        }
        return li;
    }
}