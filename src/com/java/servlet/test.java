package com.java.servlet;

import java.util.regex.Pattern;

public class test {
	 public static boolean regularID(String id) { //�������� String id1 =
			/*
			 * Pattern.compile("\\s").matcher(id).replaceAll(""); String id2 =
			 * id1.replaceAll(" ", "");
			 */
			if (Pattern.matches("^[a-zA-z0-9]{6,15}$", id)) {
				return true;

			} else {
				return false;
			}
		}
	 public static boolean regularPhone(String phone) {
			if (Pattern.matches("^01(?:0|1|[6-9])(?:\\d{3}|\\d{4})\\d{4}$", phone)) {
				return true;

			} else {
				return false;
			}
		}
	 
	 public static boolean regularNum(String num) {
			if (Pattern.matches("[\\d$-]{22,22}", num)) {
				return true;

			} else {
				return false;
			}
		}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//String pattern = "^[��-�R]{2,4}$"; //�ѱ�
		//String pattern = "^[a-zA-z0-9]{6,15}$";//���̵�
		//String pattern = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$"; ��й�ȣ
		//String pattern = "^01(?:0|1|[6-9])(?:\\d{3}|\\d{4})\\d{4}$";
		String pattern = "^[0-9](?=.*?[-]).{22,22}$";
		//String parttern = "[\\d$-]{22,22}"; //숫자와 특수문자 - 만허용
		String id = "0000000";
		if(true ==test.regularNum(id)) {
			System.out.println("true");
		}else {
			System.out.println("false");
		}
		 
		
		
		
		//boolean regex = Pattern.matches(pattern, val);
		//System.out.println(regex);

	}

}
