package bo;

import java.util.ArrayList;

import bean.wishlistbean;

public class wishlistbo {
	public ArrayList<wishlistbean> ds = new ArrayList<wishlistbean>();
	   
    public void Them(String madia, String tendia,String nghesi, String anh) {
    	for(wishlistbean wl: ds)
        	if(wl.getMadia().equals(madia)) {
        		return;
        	}
    	ds.add(new wishlistbean(madia, tendia, nghesi, anh));
    }
}
