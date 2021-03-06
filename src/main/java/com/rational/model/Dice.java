package com.rational.model;

import com.rational.model.entities.ClassModel;
import com.rational.model.entities.SpellModel;
import com.rational.model.equipment.WeaponModel;
import org.codehaus.jackson.annotate.JsonBackReference;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by Andy on 7/23/2014.
 */
@Entity
@Table(name="dice")
public class Dice {

    private Long id;
    @Column(name="name")
    private String name;

    private int maxRoll;

    private int minRoll = 1;

    private Integer averageRoll;

    private List<ClassModel> classes = new ArrayList<ClassModel>();
    private List<WeaponModel> weapons = new ArrayList<WeaponModel>();

    private List<ClassModel> classWealthDie = new ArrayList<ClassModel>();

    private List<SpellModel> spells = new ArrayList<SpellModel>();

    public Dice(){}

    public Dice(Dice dice){
        this.name = dice.getName();
        this.minRoll = dice.getMinRoll();
        this.maxRoll = dice.getMaxRoll();
        this.averageRoll = dice.getAverageRoll();
    }

    public Dice(String name, int min, int max, int average){
        this.name = name;
        this.minRoll = min;
        this.maxRoll = max;
        this.averageRoll = average;
    }

    public int roll(Integer amt) {
        Random rand = new Random();
        Integer totalRoll = 0;
        for(int i=0; i<amt; i++) {
            totalRoll += rand.nextInt(this.getMaxRoll()) + this.getMinRoll();
        }
        return totalRoll;
    }

    public static Dice getD6(){
        return new Dice("d6", 1, 6, 4);
    }

    @Id @GeneratedValue
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name="max_roll")
    public Integer getMaxRoll() {
        return maxRoll;
    }

    public void setMaxRoll(int minimumValue) {
        this.maxRoll = minimumValue;
    }

    @Column(name="min_roll")
    public Integer getMinRoll() {
        return minRoll;
    }

    public void setMinRoll(Integer minRoll) {
        this.minRoll = minRoll;
    }

    public void setClasses(List<ClassModel> classes) {
        this.classes = classes;
    }

    @JsonBackReference
    @OneToMany(mappedBy = "damageDice", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    public List<WeaponModel> getWeapons() {
        return weapons;
    }

    @JsonBackReference
    @OneToMany(mappedBy = "hitDie", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    public List<ClassModel> getClasses() {
        return classes;
    }

    public void setWeapons(List<WeaponModel> weapons) {
        this.weapons = weapons;
    }

    @JsonBackReference
    @OneToMany(mappedBy = "startingWealthDie", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    public List<ClassModel> getClassWealthDie() {
        return classWealthDie;
    }

    public void setClassWealthDie(List<ClassModel> classWealthDie) {
        this.classWealthDie = classWealthDie;
    }

    @JsonBackReference @OneToMany(mappedBy = "damageDice", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    public List<SpellModel> getSpells() {
        return spells;
    }

    public void setSpells(List<SpellModel> spells) {
        this.spells = spells;
    }

    @Column(name="average_roll")
    public Integer getAverageRoll() {
        return averageRoll;
    }

    public void setAverageRoll(Integer averageRoll) {
        this.averageRoll = averageRoll;
    }
}
