package entity;

/**
 * Created by ministrong on 2018/7/19.
 */
public class activity {

    public String act_name;
    public String act_time;
    public String place;
    public String publisher;
    public String act_introduction;
    public String user;
    public int state;


    public void setState(int state){this.state=state;}
    public void setAct_name(String act_name){
        this.act_name=act_name;
    }
    public void setAct_time(String act_time){
        this.act_time=act_time;
    }
    public  void setPlace(String place){
        this.place=place;
    }
    public void setPublisher(String publisher){
        this.publisher=publisher;
    }

    public void setAct_introduction(String act_introduction){
        this.act_introduction=act_introduction;
    }

    public void setUser(String user){this.user=user;}

    public String getUser(){
        return user;
    }

    public String getAct_name(){
        return act_name;

    }

    public String getAct_time(){
        return act_time;
    }
    public String getPlace(){
        return place;
    }
    public  String getAct_introduction(){
        return act_introduction;
    }

    public String getPublisher(){
        return publisher;
    }

    public int getState(){return state;}
}
