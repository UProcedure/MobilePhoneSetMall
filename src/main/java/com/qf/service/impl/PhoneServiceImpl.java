package com.qf.service.impl;

import com.github.pagehelper.PageHelper;
import com.qf.dao.IBaseDao;
import com.qf.entity.Page;
import com.qf.entity.Phone;
import com.qf.mapper.GoodsMapper;
import com.qf.mapper.PhoneMapper;
import com.qf.service.IPhoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author qq166
 */
@Service
public class PhoneServiceImpl extends BaseServiceImpl<Phone> implements IPhoneService {
    @Autowired
    private PhoneMapper phoneMapper;
    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public IBaseDao<Phone> getDao() {
        return phoneMapper;
    }

    @Override
    public List<Phone> getPhoneByBrandId(int brandId) {
        return phoneMapper.getPhoneByBrandId(brandId);
    }

    @Override
    public Phone getPhoneByPhoneName(String phoneName) {
        return phoneMapper.getPhoneByPhoneName(phoneName);
    }

    @Override
    public Phone getPhoneByPhoneNameBrandId(String phoneName, int brandId) {
        return phoneMapper.getPhoneByPhoneNameBrandId(phoneName,brandId);
    }

    @Override
    public boolean deleteByPhoneId(Integer phoneId) {
        int i = phoneMapper.deleteByPrimaryKey(phoneId);
        int x = goodsMapper.deletePhoneId(phoneId);
        return i>0||x>0;
    }

    @Override
    public Page<Phone> getPhoneByBrandIdPage(Page<Phone> objectPage, int brandId) {
        PageHelper.startPage(objectPage.getCurrentPage(),objectPage.getPageSize());
        List<Phone> phoneByBrandId = phoneMapper.getPhoneByBrandId(brandId);
        return new Page<Phone> (phoneByBrandId);
    }
}
