package com.liuge.pojo;

import java.io.Serializable;

/**
 * @ClassName: Repost
 * @Description: TODO
 * @author: LiuGe
 * @date: 2020/5/5  15:29
 */
public class Repost implements Serializable {
    private Integer repostid;
    private String modifytime;
    private String publishtime;
    private Integer postid;
    private Integer userid;
    private String  content;

    public Integer getRepostid() {
        return repostid;
    }

    public void setRepostid(Integer repostid) {
        this.repostid = repostid;
    }

    public String getModifytime() {
        return modifytime;
    }

    public void setModifytime(String modifytime) {
        this.modifytime = modifytime;
    }

    public String getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(String publishtime) {
        this.publishtime = publishtime;
    }

    public Integer getPostid() {
        return postid;
    }

    public void setPostid(Integer postid) {
        this.postid = postid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Repost{" +
                "repostid=" + repostid +
                ", modifytime='" + modifytime + '\'' +
                ", publishtime='" + publishtime + '\'' +
                ", postid=" + postid +
                ", userid=" + userid +
                ", content='" + content + '\'' +
                '}';
    }
}
