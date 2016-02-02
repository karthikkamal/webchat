import java.io.InputStream;
import org.apache.commons.io.IOUtils;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
 
public class ConvertStringToInputStreamExample
{
   public static void main(String[] args)
   {
      String sampleString = "[B@103c520";
       
      //Here converting string to input stream
	  try{
      byte bytes[];
	  for(int i=0;i<sampleString.length();i++)
	   {
	     bytes[i]="0"+sampleString.get(i);
		 
	   }
	   System.out.println(bytes);
	 
	  }
	  catch(Exception e)
	   {
	   
	   }
   }
}