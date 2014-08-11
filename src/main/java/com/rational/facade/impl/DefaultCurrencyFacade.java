package com.rational.facade.impl;

import com.rational.facade.CurrencyFacade;
import com.rational.model.entities.CoinPurse;
import com.rational.model.exceptions.CurrencyConversionException;
import com.rational.service.AdminService;
import com.rational.service.CurrencyService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
public class DefaultCurrencyFacade implements CurrencyFacade {

    @Resource
    private CurrencyService currencyService;

    @Resource
    private AdminService adminService;

    @Override
    public CoinPurse convertCurrency(String from, String to, Integer amt) throws CurrencyConversionException{

        

        return null;
    }


}
