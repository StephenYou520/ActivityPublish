package Dao;

import entity.activity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Created by ministrong on 2018/7/19.
 */
public class activityDao {

   public int check(activity newactivity){

       String act_name=newactivity.getAct_name();
       String act_time=newactivity.getAct_time();
       String place =newactivity.getPlace();
       String publisher=newactivity.getPublisher();
       String act_introduction=newactivity.getAct_introduction();
       String user=newactivity.getUser();
       int state =newactivity.getState();


       if(act_name.equals("")) return 2;
       if(act_time.equals("")) return 3;
       if(place.equals("")) return 4;
       if(publisher.equals("")) return 5;
       if(act_introduction.equals("")) return 6;




       try {

           Class.forName("com.mysql.jdbc.Driver");
           String url = "jdbc:mysql://localhost:3306/ActivityPublish";
           String usename = "root";
           String psw = "stephenyou520";




           Connection conn = DriverManager.getConnection(url, usename, psw);//得到连接




               PreparedStatement tmt = conn.prepareStatement("Insert into activity(act_name,act_time,place,publisher,user,act_introduction,state) values('" + act_name + "','" + act_time + "','" + place + "','" + publisher +"','"+user +"','"+ act_introduction + "','"+state+ "')");
               int rst = tmt.executeUpdate();

               if (rst != 0) {

                   return 1;

               } else {

                   return 0;
               }

       } catch (Exception e) {
           System.out.println(e);
       }

       return  0;




    }




}
