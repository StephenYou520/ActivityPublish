package Dao;

import entity.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by ministrong on 2018/7/19.
 */
public class loginDao {

    public int check(user loginuser){
        String user = loginuser.getName();
        String pwd=loginuser.getPassword();

        try {

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/ActivityPublish";
            String usename = "root";
            String psw = "stephenyou520";




            Connection conn = DriverManager.getConnection(url, usename, psw);//得到连接


            if(conn==null) return 5;

            PreparedStatement pStmt = conn.prepareStatement("select * from users where name = '" + user + "'");
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {//用户存在


                String temp=rs.getString("password");

                if(temp.equals(loginuser.getPassword())){
                    return 1; //用户名和密码都正确
                }else{
                    return 2;//密码错误
                }


            }
            else return 3;//无此用户
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
}
