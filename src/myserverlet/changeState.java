package myserverlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Created by ministrong on 2018/7/22.
 */
public class changeState {

    public void change(String state,String id){
        try {

            System.out.println(state);
            System.out.println(id);

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/ActivityPublish?characterEncoding=utf8&useUnicode=true&useSSL=false&serverTimezone=UTC";
            String usename = "root";
            String psw = "stephenyou520";


            String sqll="UPDATE activity SET state ='"+state+"' WHERE id ='"+id+"'";

            Connection conn = DriverManager.getConnection(url, usename, psw);//得到连接

            PreparedStatement pStmt = conn.prepareStatement(sqll);
            pStmt.execute();




        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
