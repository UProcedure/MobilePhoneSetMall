package com.qf.mapper;

import com.qf.dao.IBaseDao;
import com.qf.entity.ReceivingAddress;

import java.util.List;

/**
 * @author qq166
 */
public interface ReceivingAddressMapper extends IBaseDao<ReceivingAddress> {

    List<ReceivingAddress> getAddress(int id);

    ReceivingAddress getAddressByAddressId(int id);

}