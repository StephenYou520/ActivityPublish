package myserverlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by ministrong on 2018/7/20.
 */
public class mypubactivity {

    public ResultSet getmypubactivity(String user){

            //System.out.println("getmypubactivity被调用");


        try {

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1:3306/ActivityPublish?characterEncoding=utf8&useUnicode=true&useSSL=false&serverTimezone=UTC";
            String usename = "root";
            String psw = "stephenyou520";
           // jdbc.url=jdbc:mysql://127.0.0.1:3306/test?characterEncoding=utf8&useUnicode=true&useSSL=false&serverTimezone=UTC
           // jdbc.url=jdbc:mysql:///test?characterEncoding=utf8&useUnicode=true&useSSL=false&serverTimezone=UTC





            Connection conn = DriverManager.getConnection(url, usename, psw);//得到连接

            //System.out.println("数据库已经连接");

            //if(conn==null) System.out.println("没有连接");



            PreparedStatement pStmt = conn.prepareStatement("select * from activity where user = '" + user + "'");
            ResultSet rst = pStmt.executeQuery();

            //if(rst.next()) System.out.println("结果集不为空!");
            //else System.out.println("结果集为空!");


            //System.out.println("语句已经执行");

            return rst;

           // System.out.println(rst.getObject(1).toString());


            //ArrayList<activity> activities = new ArrayList<activity>();

           // if(rst.next()){


               // return rst;

               /* System.out.println(rst.getObject(1).toString());
                System.out.println(rst.getObject(3).toString());

                activity act= new activity();
                //获取数据

                act.setAct_name(rst.getString(1));
                //act.setAct_name(rst.getString("act_name"));
                //System.out.println(act.getAct_name());
                act.setAct_time(rst.getString(3));

                System.out.println(rst.getObject(3).toString());
                act.setPlace(rst.getString(4));
                act.setPublisher(rst.getString(5));
                act.setAct_introduction(rst.getString(6));
                act.setUser(rst.getString(7));
                act.setState(rst.getInt(8));


                //System.out.println(act.getAct_name());




                activities.add(act);

                if(!activities.isEmpty())  System.out.println("加载时activities里有值");
                else System.out.println("加载时activities里没有值");
                */

           // }else return null;



            /*if(!activities.isEmpty())  System.out.println("activities里有值");
            else System.out.println("activities里没有值");*/

            //return rst;

        } catch (Exception e) {
            System.out.println(e);
        }



        return null;



    }


}
