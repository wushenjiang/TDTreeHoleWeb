package com.liuge.service.impl;

import com.liuge.dao.repostdao.RepostDao;
import com.liuge.pojo.Repost;
import com.liuge.service.RepostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName: RepostServiceImpl
 * @Description: TODO
 * @author: LiuGe
 * @date: 2020/5/6  1:30
 */
@Service
public class RepostServiceImpl implements RepostService {
    @Autowired
    private RepostDao repostDao;
    @Override
    public List<Repost> findAllRepost() {
        List<Repost> reposts = repostDao.findAllRepost();
        return reposts;
    }

    @Override
    public Repost findRepostById(Integer repostid) {
        Repost repost = repostDao.findRepostById(repostid);
        return repost;
    }

    @Override
    public void updateRepost(Repost repost) {
        repostDao.updateRepost(repost);
    }

    @Override
    public void deleteRepost(Integer repostid) {
        repostDao.deleteRepost(repostid);
    }

}
