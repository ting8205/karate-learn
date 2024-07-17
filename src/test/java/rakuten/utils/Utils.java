package rakuten.utils;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

public class Utils {
    public static List<String> getLocalDate(Object offset) {
        LocalDate date = LocalDate.now().plusDays(Integer.parseInt(offset.toString()));
        List<String> asList = new ArrayList<>();
        asList.add(Integer.toString(date.getYear()));
        asList.add(Integer.toString(date.getMonthValue()));
        asList.add(Integer.toString(date.getDayOfMonth()));
        return asList;
    }

    public static Map<String, String> stringToMap(String str) {
        Gson gson = new Gson();
        return gson.fromJson( str, new TypeToken< Map< String, String > >(){
        }.getType() );
    }
    public static String getFormattedDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Date date = new Date();
        return sdf.format(date);
    }
    public static String getFormattedDate(String s) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
        Date date = sdf.parse(s);
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.HOUR_OF_DAY,-1);
        Date newDate = cal.getTime();
        return sdf.format(newDate);
    }
    public static int generateRandomNumber(){
        int randomHotelNumber = (int) Math.floor(100000 + Math.random() * 900000);
        return randomHotelNumber;
    }
    public static String getFormattedPulsDate(String s) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Date date = sdf.parse(s);
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DAY_OF_MONTH,20);
        Date newDate = cal.getTime();
        return sdf.format(newDate);
    }

}
