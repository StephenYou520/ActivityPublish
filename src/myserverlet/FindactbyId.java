package myserverlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by ministrong on 2018/7/22.
 */
public class FindactbyId {


    public ResultSet getactbyid(String id){
        try {

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/ActivityPublish?characterEncoding=utf8&useUnicode=true&useSSL=false&serverTimezone=UTC";
            String usename = "root";
            String psw = "stephenyou520";


            String sqll="select * from activity WHERE id ="+id;

            Connection conn = DriverManager.getConnection(url, usename, psw);//得到连接

            PreparedStatement pStmt = conn.prepareStatement(sqll);
            ResultSet rst = pStmt.executeQuery();


            return rst;


        } catch (Exception e) {
            System.out.println(e);
        }

        return null;
    }
}
