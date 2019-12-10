package com.qf.service;

import com.qf.entity.ReceivingAddress;

import java.util.List;

/**
 * @author qq166
 */
public interface IReceivingAddressService extends IBaseService<ReceivingAddress>{

    List<ReceivingAddress> getAddress(int id);

    ReceivingAddress getAddressByAddressId(int id);

}
