package com.liuge.dao.repostdao;

import com.liuge.pojo.Repost;

import java.util.List;

/**
 * @ClassName: RepostDao
 * @Description: TODO
 * @author: LiuGe
 * @date: 2020/5/6  1:29
 */
public interface RepostDao {
    /**
     * 查找所有的回帖
     * @return
     */
    List<Repost> findAllRepost();

    /**
     * 通过id查找回帖
     * @param repostid
     * @return
     */
    Repost findRepostById(Integer repostid);

    /**
     * 更新回帖
     * @param repost
     */
    void updateRepost(Repost repost);

    /**
     * 删除回帖
     * @param repostid
     */
    void deleteRepost(Integer repostid);
}
