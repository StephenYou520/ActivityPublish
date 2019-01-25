package entity;

/**
 * Created by ministrong on 2018/7/18.
 */
public class user {
    String name;
    String password;
    String email;
    String phonenum;

    public void setEmail(String email) {
        this.email = email;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public String getPhonenum() {
        return phonenum;
    }
}
