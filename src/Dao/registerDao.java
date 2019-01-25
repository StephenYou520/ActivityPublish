package Dao;

import entity.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by ministrong on 2018/7/19.
 */
public class registerDao {


    public int check(user newuser) {


        String user=newuser.getName();
        String phone_num=newuser.getPhonenum();
        String email=newuser.getEmail();
        String pwd=newuser.getPassword();

        //System.out.println(user);
        try {

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/ActivityPublish?characterEncoding=utf-8&useUnicode=true&useSSL=false&serverTimezone=UTC";
            String usename = "root";
            String psw = "stephenyou520";




            Connection conn = DriverManager.getConnection(url, usename, psw);//得到连接


            if(conn==null) return 5;

            PreparedStatement pStmt = conn.prepareStatement("select * from users where name = '" + user + "'");
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {//判断用户名是否重复


               return 1;
            } else {

                PreparedStatement tmt = conn.prepareStatement("Insert into users(name,phone,email,password) values('" + user + "','" + phone_num + "','" + email + "','" + pwd + "')");
                int rst = tmt.executeUpdate();

                if (rst != 0) {

                    return 2;

                } else {

                    return 0;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return  0;

    }
}


