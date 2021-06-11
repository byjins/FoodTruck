package com.java.servlet;
import java.util.ArrayList;
import java.util.List;

public class InfoSelector {
	public List getInfos(String[] sel) {
		List val = new ArrayList();
		int mx = sel.length;
		for(int i =0;i<mx;i++) {
			val.add(sel[i]);
		}
		return val;
	}
}
