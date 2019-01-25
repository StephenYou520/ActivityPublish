package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by ministrong on 2018/7/23.
 */
public class signDao {



    public String signup(String id,String activityname,String realname,String username,String userphone,String useremail)
    {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/ActivityPublish?characterEncoding=utf-8&useUnicode=true&useSSL=false&serverTimezone=UTC";
            String usename = "root";
            String psw = "stephenyou520";




            Connection conn = DriverManager.getConnection(url, usename, psw);//得到连接


            if(conn==null) return "连接出错，报名失败！";

            PreparedStatement pStmt = conn.prepareStatement("select * from activityuser where realname = '" + realname + "' AND actid='"+id+"'");
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {//判断是否重复


                return "用户已报名！";
            } else {

                PreparedStatement tmt = conn.prepareStatement("Insert into activityuser(actid,activityname,realname,username,userphone,useremail) values('" + id + "','" + activityname + "','" + realname + "','" + username+"','"+userphone+"','"+useremail+"')");
                int rst = tmt.executeUpdate();

                if (rst != 0) {

                    return "报名成功！";

                } else {

                    return "报名失败，请重新报名！";
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }

       return "未知错误！";

    }
}
