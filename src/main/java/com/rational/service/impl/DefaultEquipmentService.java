package com.rational.service.impl;

import com.google.common.collect.Lists;
import com.rational.model.entities.Coin;
import com.rational.model.entities.CoinPurse;
import com.rational.model.enums.CoinTypeEnum;
import com.rational.model.equipment.*;
import com.rational.repository.*;
import com.rational.service.EquipmentService;
import org.hibernate.validator.jtype.TypeUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service("defaultEquipmentService")
public class DefaultEquipmentService implements EquipmentService {


    @Resource
    private WeaponGroupRepository weaponGroupRepository;

    @Resource
    private ArmorGroupRepository armorGroupRepository;

    @Resource
    private WeaponRepository weaponRepository;

    @Resource
    private ArmorRepository armorRepository;

    @Resource
    private CoinRepository coinRepository;

    @Resource
    private EquipmentRepository equipmentRepository;

    @Resource
    private CoinPurseRepository coinPurseRepository;

    /* Weapons */

    @Override
    @Transactional
    public WeaponModel saveWeapon(WeaponModel weapon) {
        return weaponRepository.save(weapon);
    }

    @Override
    public WeaponModel findWeapon(Long id) {
        return weaponRepository.findOne(id);
    }

    @Override
    public List<WeaponModel> findAllWeapons() {
        return weaponRepository.findAll();
    }


    /* Armor */

    @Override
    @Transactional
    public ArmorModel saveArmor(ArmorModel armor) {
        return armorRepository.save(armor);
    }

    @Override
    public ArmorModel findArmor(Long id) {
        return armorRepository.findOne(id);
    }

    @Override
    public List<ArmorModel> findAllArmor() {
        return armorRepository.findAll();
    }

    @Override
    public ArmorGroup findArmorGroup(Long id) {
        return armorGroupRepository.findOne(id);
    }

    @Override
    public List<ArmorGroup> findAllArmorGroups() {
        return armorGroupRepository.findAll();
    }


    @Override
    public WeaponGroup findWeaponGroup(Long id) {
        return weaponGroupRepository.findOne(id);
    }

    @Override
    public List<WeaponGroup> findAllWeaponGroups() {
        return weaponGroupRepository.findAll();
    }

    @Override
    public Coin findCoin(Long id) {
        return coinRepository.findOne(id);
    }

    @Override
    public Coin findCoinByType(CoinTypeEnum type){
        List<Coin> allCoins = coinRepository.findAll();

        for(Coin coin : allCoins){
            if(coin.getDenomination() == type.getType()){
                return coin;
            }
        }
        return null;
    }

    @Override
    public List<Coin> findAllCoins() {
        return coinRepository.findAll();
    }

    @Override
    public Coin findCoinByName(String name){return coinRepository.findCoinByName(name);}

    @Override
    public List<EquipmentModel> findEquipment(Set<Long> ids) {
        return Lists.newArrayList(equipmentRepository.findAll(ids));
    }

    @Override
    public EquipmentModel findEquipment(Long id) {
        return equipmentRepository.findOne(id);
    }

    @Override
    public CoinPurse saveCoinPurse(CoinPurse purse){
        return coinPurseRepository.save(purse);
    }

    @Override
    public List<EquipmentModel> findEquipmentOfType(Type type) {
        List<EquipmentModel> equipmentModels = equipmentRepository.findAll();
        List<EquipmentModel> temp = new ArrayList<EquipmentModel>(equipmentModels);
        for(EquipmentModel model : temp){
            if(!TypeUtils.isInstance(type, model)){
                equipmentModels.remove(model);
            }
        }
        return equipmentModels;
    }

    @Override
    public List<EquipmentModel> findAllEquipment(){
        return equipmentRepository.findAll();
    }
}
