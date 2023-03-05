package bo;

import java.util.ArrayList;

import bean.cartbean;


public class cartbo {
	public ArrayList<cartbean> ds = new ArrayList<cartbean>();
	   
    public void Them(String madia, String tendia, long soluong, long gia,  String anh) {
    for(cartbean g: ds)
    	if(g.getMadia().equals(madia)) {
    		g.setSoluong(soluong+ g.getSoluong());
    		return;
    	}
    ds.add(new cartbean(madia, tendia, soluong, gia, anh, gia));
    }
    public long TongTien() {
    	long s=0;
    	  for(cartbean g: ds)
    		  s=s+g.getThanhtien();
    	  return s;
    }
}
