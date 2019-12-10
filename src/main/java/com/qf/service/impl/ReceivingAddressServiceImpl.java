package com.qf.service.impl;

import com.qf.dao.IBaseDao;
import com.qf.entity.ReceivingAddress;
import com.qf.mapper.ReceivingAddressMapper;
import com.qf.service.IReceivingAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author weimin
 * @ClassName ReceivingAddressServiceImpl
 * @Description TODO
 * @date 2019/10/12 11:24
 */
@Service
public class ReceivingAddressServiceImpl extends BaseServiceImpl<ReceivingAddress> implements IReceivingAddressService {

    @Autowired
    private ReceivingAddressMapper receivingAddressMapper;

    @Override
    public IBaseDao<ReceivingAddress> getDao() {
        return receivingAddressMapper;
    }


    @Override
    public List<ReceivingAddress> getAddress(int id) {
        List<ReceivingAddress> receivingAddresses = receivingAddressMapper.getAddress(id);
        return receivingAddresses;
    }

    @Override
    public ReceivingAddress getAddressByAddressId(int id) {
        return receivingAddressMapper.getAddressByAddressId(id);
    }


}
