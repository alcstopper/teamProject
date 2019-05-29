package com.internousdev.leo.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.leo.dao.UserInfoDAO;
import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport implements SessionAware{
//	テーブルから取得するデータに対応したフィールド変数を宣言する
	private Map<String,Object>session;

	public String execute() {

//		UserInfoDAOを使用したいので、変数に代入する
		UserInfoDAO userInfoDAO = new UserInfoDAO();

//		取得したユーザーIDをString型に変換する
//		(nll値が入った場合に、NullPointerExceptionを発生せずnullを返す)
		String userId = String.valueOf(session.get("userId"));

//		取得したユーザーID保存フラグををString型に変換してからBoolean型に変換する
//		(nll値が入った場合に、NullPointerExceptionを発生せずnullを返す)
		boolean savedUserId = Boolean.valueOf(String.valueOf(session.get("savedUserIdFlag")));

//		数値にUserInfoDAOのユーザーIDを代入
		int count = userInfoDAO.logout(userId);

//		もしuserIdの値が０より大きくない場合セッションの値を消去する
		if(count > 0) {
			session.clear();

//		もしユーザーID保存が選択されている場合ユーザーIDを保存しておく
			if(savedUserId) {
				session.put("savedUserIdFlag",savedUserId);
				session.put("savedUserId",userId);
			}
		}
		return SUCCESS;
	}
	public Map<String,Object> getSession() {
		return session;
	}
	public void setSession(Map<String,Object>session) {
		this.session = session;
	}
}
