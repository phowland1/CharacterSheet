package com.rational.model.entities;


import com.rational.model.enums.CoinTypeEnum;
import com.rational.model.equipment.EquipmentModel;
import org.codehaus.jackson.annotate.JsonBackReference;

import javax.persistence.*;
import java.util.List;

@Entity
public class Coin {

    @Id @GeneratedValue private Long id;

    private String denomination;

    private String abbr;

    private Long lowerCoin;

    @OneToMany(mappedBy = "priceDenomination", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JsonBackReference private List<EquipmentModel> equipment;

    public String getDenomination() {
        return denomination;
    }

    public void setDenomination(String denomination) {
        this.denomination = denomination;
    }

    public Coin(){

    }

    public Coin(CoinTypeEnum type){
        denomination = type.getType();
        abbr = type.getAbbr();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAbbr() {
        return abbr;
    }

    public void setAbbr(String abbr) {
        this.abbr = abbr;
    }

    public List<EquipmentModel> getEquipment() {
        return equipment;
    }

    public void setEquipment(List<EquipmentModel> equipment) {
        this.equipment = equipment;
    }

    public CoinTypeEnum getCoinType(){
        return CoinTypeEnum.valueOf(denomination.toUpperCase());
    }

    public Long getLowerCoin() {
        return lowerCoin;
    }

    public void setLowerCoin(Long lowerCoin) {
        this.lowerCoin = lowerCoin;
    }
}
