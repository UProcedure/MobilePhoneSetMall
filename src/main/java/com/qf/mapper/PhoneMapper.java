package com.qf.mapper;

import com.qf.dao.IBaseDao;
import com.qf.entity.Phone;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PhoneMapper extends IBaseDao<Phone> {

    List<Phone> getPhoneByBrandId(int brandId);

    Phone getPhoneByPhoneName(String phoneName);

    Phone getPhoneByPhoneNameBrandId(@Param("phoneName") String phoneName, @Param("brandId") int brandId);

    int deleteByBrandId(Integer brandId);
}