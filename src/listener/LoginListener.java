package listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import models.Representor;

public class LoginListener implements HttpSessionAttributeListener{

	public static List<Representor> list = new ArrayList<Representor>();
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub
		if(arg0.getName().equals("user")){
			Representor rep = (Representor) arg0.getValue();
			list.add(rep);
		}
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub
		int n = 0;
		Representor rep = (Representor) arg0.getValue();
		for(int i = 0; i < list.size(); i++){
			Representor rep2 = list.get(i);
			if(rep.getRep_no() == rep2.getRep_no()){
				n = i;
				break;
			}
		}
		list.remove(n);
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub
		
	}

}
