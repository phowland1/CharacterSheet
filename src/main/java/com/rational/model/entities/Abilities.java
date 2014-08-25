package com.rational.model.entities;

import com.rational.model.enums.AbilityTypeEnum;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.lang.reflect.InvocationTargetException;

/**
 * Created by Andy on 8/18/2014.
 */
@Entity
public class Abilities {

    public static final Integer MAX_ABILITY_POINTS = 27;
    @Id
    @GeneratedValue
    private Long id;
    @Column(name="ability_points_used")private Integer abilityPointsRemaining = MAX_ABILITY_POINTS;
    private Integer str;
    private Integer dex;
    private Integer con;
    private Integer intel;
    private Integer wis;
    private Integer cha;

    public Abilities(){}

    public Abilities(Integer str, Integer dex, Integer con, Integer intel, Integer wis, Integer cha){
        this.str = str;
        this.dex = dex;
        this.con = con;
        this.intel = intel;
        this.wis = wis;
        this.cha = cha;
    }

    public void increaseDecreaseScoreByOne(AbilityTypeEnum ability, Boolean positive){
        int score = positive ? getAbilityScore(ability)+1 : getAbilityScore(ability)-1;
        abilityPointsRemaining -= getScoreCost(score);
        setAbilityScore(ability, score);
    }

    public void setAbilityScore(AbilityTypeEnum ability, Integer score){
        try {
            this.getClass().getMethod("set" + ability.toString(), Integer.class).invoke(this, score);
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
            return (Integer)this.getClass().getMethod("get" + ability.toString()).invoke(this);
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
            score = (Integer)Abilities.class.getMethod("get" + ability.toString()).invoke(this);
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

    public Integer getTotalAbilityCost(){
        return getScoreCost(str) + getScoreCost(dex) + getScoreCost(con) + getScoreCost(intel) + getScoreCost(wis) + getScoreCost(cha);
    }

    public Integer getScoreCost(Integer score){
        return score - 8 + (score - 13 > 0 ? score - 13: 0);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getStr() {
        return str;
    }

    public void setStr(Integer str) {
        this.str = str;
    }

    public Integer getDex() {
        return dex;
    }

    public void setDex(Integer dex) {
        this.dex = dex;
    }

    public Integer getCon() {
        return con;
    }

    public void setCon(Integer con) {
        this.con = con;
    }

    public Integer getIntel() {
        return intel;
    }

    public void setIntel(Integer intel) {
        this.intel = intel;
    }

    public Integer getWis() {
        return wis;
    }

    public void setWis(Integer wis) {
        this.wis = wis;
    }

    public Integer getCha() {
        return cha;
    }

    public void setCha(Integer cha) {
        this.cha = cha;
    }

    public Integer getAbilityPointsRemaining() {
        return abilityPointsRemaining;
    }

    public void setAbilityPointsRemaining(Integer abilityPointsRemaining) {
        this.abilityPointsRemaining = abilityPointsRemaining;
    }
}
