package com.rational.model.entities;

import com.rational.model.enums.AbilityTypeEnum;

import javax.persistence.*;
import java.lang.reflect.InvocationTargetException;

@Entity
public class Abilities {

    @Transient private Integer maxAbilityPoints = 27;
    @Transient private Integer maxAbilityScore = 15;
    @Transient private Integer minAbilityScore = 8;

    @Id
    @GeneratedValue
    private Long id;
    private Integer str = minAbilityScore;
    private Integer dex = minAbilityScore;
    private Integer con = minAbilityScore;
    private Integer intel = minAbilityScore;
    private Integer wis = minAbilityScore;
    private Integer cha = minAbilityScore;
    @Column(name="str_bonus") private Integer strBonus= 0;
    @Column(name="dex_bonus")private Integer dexBonus= 0;
    @Column(name="con_bonus")private Integer conBonus= 0;
    @Column(name="intel_bonus")private Integer intelBonus= 0;
    @Column(name="wis_bonus")private Integer wisBonus= 0;
    @Column(name="cha_bonus")private Integer chaBonus= 0;
    @Column(name="available_ability_points")
    private Integer availableAbilityPoints = 27;
    @Column(name="ability_increase_points")
    private Integer abilityIncreasePoints = 0;
    private Boolean locked = false;
    private Boolean strCanIncrease = true;
    private Boolean dexCanIncrease = true;
    private Boolean conCanIncrease = true;
    private Boolean intelCanIncrease = true;
    private Boolean wisCanIncrease = true;
    private Boolean chaCanIncrease = true;

    public Abilities(){}

    public Abilities(Integer str, Integer dex, Integer con, Integer intel, Integer wis, Integer cha){
        this.str = str;
        this.dex = dex;
        this.con = con;
        this.intel = intel;
        this.wis = wis;
        this.cha = cha;
    }

    public Abilities(String str, String dex, String con, String intel, String wis, String cha){
        this.str = Integer.decode(str);
        this.dex = Integer.decode(dex);
        this.con = Integer.decode(con);
        this.intel = Integer.decode(intel);
        this.wis = Integer.decode(wis);
        this.cha = Integer.decode(cha);
    }

    public void setAbilityScore(AbilityTypeEnum ability, Integer score){
        try {
            this.getClass().getMethod("set" + ability.name(), Integer.class).invoke(this, score);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
    }

    public void setAbilityScoreBonus(AbilityTypeEnum ability, Integer score){
        try {
            this.getClass().getMethod("set" + ability.name() + "Bonus", Integer.class).invoke(this, score);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
    }

    public Integer getAbilityScore(AbilityTypeEnum ability){
        try {
            return (Integer)this.getClass().getMethod("get" + ability.name()).invoke(this);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Integer getAbilityScoreBonus(AbilityTypeEnum ability){
        try {
            return (Integer)this.getClass().getMethod("get" + ability.name() + "Bonus").invoke(this);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Integer getAbilityModifier(AbilityTypeEnum ability){
        Integer score = 0;
        try {
            score = (Integer)Abilities.class.getMethod("get" + ability.name()).invoke(this);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }

        if(score != null)
            return Math.round(score/2 - 5);
        else
            return null;
    }

    public Integer getScoreCost(Integer score){
        return score - 8 + (score - 13 > 0 ? score - 13: 0);
    }

    public Integer getPointsSpent(){
        Integer pointsSpent = 0;

        pointsSpent = pointsSpent + getScoreCost(str);
        pointsSpent = pointsSpent + getScoreCost(dex);
        pointsSpent = pointsSpent + getScoreCost(con);
        pointsSpent = pointsSpent + getScoreCost(intel);
        pointsSpent = pointsSpent + getScoreCost(wis);
        pointsSpent = pointsSpent + getScoreCost(cha);

        return pointsSpent;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getStr() {
        return str + strBonus;
    }

    public void setStr(Integer str) {
        this.str = str;
    }

    public Integer getDex() {
        return dex + dexBonus;
    }

    public void setDex(Integer dex) {
        this.dex = dex;
    }

    public Integer getCon() {
        return con + conBonus;
    }

    public void setCon(Integer con) {
        this.con = con;
    }

    public Integer getIntel() {
        return intel + intelBonus;
    }

    public void setIntel(Integer intel) {
        this.intel = intel;
    }

    public Integer getWis() {
        return wis + wisBonus;
    }

    public void setWis(Integer wis) {
        this.wis = wis;
    }

    public Integer getCha() {
        return cha + chaBonus;
    }

    public void setCha(Integer cha) {
        this.cha = cha;
    }

    public Integer getAvailableAbilityPoints() {
        return availableAbilityPoints;
    }

    public void setAvailableAbilityPoints(Integer availableAbilityPoints) {
        this.availableAbilityPoints = availableAbilityPoints;
    }

    public Integer getMaxAbilityPoints() {
        return maxAbilityPoints;
    }

    public Integer getMaxAbilityScore() {
        return maxAbilityScore;
    }

    public Integer getMinAbilityScore() {
        return minAbilityScore;
    }

    public void setMaxAbilityPoints(Integer maxAbilityPoints) {
    }

    public void setMaxAbilityScore(Integer maxAbilityScore) {
    }

    public void setMinAbilityScore(Integer minAbilityScore) {
    }

    public void setPointsSpent(Integer pointsSpent){}

    public Integer getAbilityIncreasePoints() {
        return abilityIncreasePoints;
    }

    public void setAbilityIncreasePoints(Integer abilityIncreasePoints) {
        this.abilityIncreasePoints = abilityIncreasePoints;
    }

    public Boolean getLocked() {
        return locked;
    }

    public void setLocked(Boolean locked) {
        this.locked = locked;
    }

    public Integer getStrBonus() {
        return strBonus;
    }

    public void setStrBonus(Integer strBonus) {
        this.strBonus = strBonus;
    }

    public Integer getDexBonus() {
        return dexBonus;
    }

    public void setDexBonus(Integer dexBonus) {
        this.dexBonus = dexBonus;
    }

    public Integer getConBonus() {
        return conBonus;
    }

    public void setConBonus(Integer conBonus) {
        this.conBonus = conBonus;
    }

    public Integer getIntelBonus() {
        return intelBonus;
    }

    public void setIntelBonus(Integer intelBonus) {
        this.intelBonus = intelBonus;
    }

    public Integer getWisBonus() {
        return wisBonus;
    }

    public void setWisBonus(Integer wisBonus) {
        this.wisBonus = wisBonus;
    }

    public Integer getChaBonus() {
        return chaBonus;
    }

    public void setChaBonus(Integer chaBonus) {
        this.chaBonus = chaBonus;
    }

    public void clearBonuses(){
        strBonus = 0;
        dexBonus = 0;
        conBonus = 0;
        intelBonus = 0;
        wisBonus = 0;
        chaBonus = 0;
    }

    public Boolean getStrCanIncrease() {
        return strCanIncrease;
    }

    public void setStrCanIncrease(Boolean strCanIncrease) {
        this.strCanIncrease = strCanIncrease;
    }

    public Boolean getDexCanIncrease() {
        return dexCanIncrease;
    }

    public void setDexCanIncrease(Boolean dexCanIncrease) {
        this.dexCanIncrease = dexCanIncrease;
    }

    public Boolean getConCanIncrease() {
        return conCanIncrease;
    }

    public void setConCanIncrease(Boolean conCanIncrease) {
        this.conCanIncrease = conCanIncrease;
    }

    public Boolean getIntelCanIncrease() {
        return intelCanIncrease;
    }

    public void setIntelCanIncrease(Boolean intelCanIncrease) {
        this.intelCanIncrease = intelCanIncrease;
    }

    public Boolean getWisCanIncrease() {
        return wisCanIncrease;
    }

    public void setWisCanIncrease(Boolean wisCanIncrease) {
        this.wisCanIncrease = wisCanIncrease;
    }

    public Boolean getChaCanIncrease() {
        return chaCanIncrease;
    }

    public void setChaCanIncrease(Boolean chaCanIncrease) {
        this.chaCanIncrease = chaCanIncrease;
    }
}
