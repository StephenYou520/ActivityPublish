package myserverlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by ministrong on 2018/7/21.
 */
public class activityList {

    public ResultSet getactivitylist(){
        try {

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/ActivityPublish";
            String usename = "root";
            String psw = "stephenyou520";

            Connection conn = DriverManager.getConnection(url, usename, psw);//得到连接

            PreparedStatement pStmt = conn.prepareStatement("select * from activity");
            ResultSet rst = pStmt.executeQuery();


            return rst;


        } catch (Exception e) {
            System.out.println(e);
        }

        return null;
    }
}
