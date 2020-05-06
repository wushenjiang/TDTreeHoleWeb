package com.liuge.pojo;

import java.io.Serializable;

/**
 * @ClassName: Post
 * @Description: TODO
 * @author: LiuGe
 * @date: 2020/5/5  15:28
 */
public class Post implements Serializable {
    private Integer postid;
    private String postcontent;
    private String modifytime;
    private String posttime;
    private String title;
    private Integer userid;
    private Integer posttype;

    public Integer getPostid() {
        return postid;
    }

    public void setPostid(Integer postid) {
        this.postid = postid;
    }

    public String getPostcontent() {
        return postcontent;
    }

    public void setPostcontent(String postcontent) {
        this.postcontent = postcontent;
    }

    public String getModifytime() {
        return modifytime;
    }

    public void setModifytime(String modifytime) {
        this.modifytime = modifytime;
    }

    public String getPosttime() {
        return posttime;
    }

    public void setPosttime(String posttime) {
        this.posttime = posttime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getPosttype() {
        return posttype;
    }

    public void setPosttype(Integer posttype) {
        this.posttype = posttype;
    }

    @Override
    public String toString() {
        return "Post{" +
                "postid=" + postid +
                ", postcontent='" + postcontent + '\'' +
                ", modifytime='" + modifytime + '\'' +
                ", posttime='" + posttime + '\'' +
                ", titile='" + title + '\'' +
                ", userid=" + userid +
                ", posttype=" + posttype +
                '}';
    }
}
