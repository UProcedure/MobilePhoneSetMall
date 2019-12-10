package com.test;

import com.qf.entity.Goods;
import com.qf.entity.Page;
import com.qf.mapper.FilmMapper;
import com.qf.mapper.GoodsMapper;
import com.qf.service.IGoodsService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author weimin
 * @ClassName BackTest
 * @Description TODO
 * @date 2019/10/14 15:51
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext-*.xml")
public class BackTest {
    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private FilmMapper filmMapper;
    @Autowired
    private IGoodsService goodsService;

    @Test
    public void GoodsMapperTest(){
        List<Goods> list = goodsMapper.getGoodsSearch("壳");
        System.out.println(list);
        System.out.println(goodsService.getGoodsSearch(new Page<Goods>(),"壳"));
    }

}
