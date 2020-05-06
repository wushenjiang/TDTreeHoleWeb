package com.liuge.pojo;

import java.io.Serializable;

/**
 * @ClassName: User
 * @Description: TODO
 * @author: LiuGe
 * @date: 2020/5/5  15:30
 */
public class User implements Serializable {
    private Integer userid;
    private String username;
    private String password;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
