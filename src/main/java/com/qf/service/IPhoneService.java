package com.qf.service;

import com.qf.entity.Page;
import com.qf.entity.Phone;

import java.util.List;

/**
 * @author qq166
 */
public interface IPhoneService  extends IBaseService<Phone>{
    List<Phone> getPhoneByBrandId(int brandId);

    Phone getPhoneByPhoneName(String phoneName);

    Phone getPhoneByPhoneNameBrandId(String phoneName, int brandId);

    boolean deleteByPhoneId(Integer phoneId);

    Page<Phone> getPhoneByBrandIdPage(Page<Phone> objectPage, int brandId);
}
