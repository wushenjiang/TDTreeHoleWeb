package com.liuge.service;

import com.liuge.pojo.Repost;

import java.util.List;

/**
 * @ClassName: RepostService
 * @Description: TODO
 * @author: LiuGe
 * @date: 2020/5/6  1:28
 */
public interface RepostService {
    /**
     * 查找所有的回帖
     * @return
     */
    List<Repost> findAllRepost();

    /**
     * 根据id查找回帖
     * @param repostid
     * @return
     */
    Repost findRepostById(Integer repostid);

    /**
     * 更新回帖内容
     * @param repost
     */
    void updateRepost(Repost repost);

    /**
     * 删除回帖
     * @param repostid
     */
    void deleteRepost(Integer repostid);
}
