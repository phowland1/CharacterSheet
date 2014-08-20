package com.rational.model.entities;


import com.rational.model.Proficiency;
import com.rational.model.enums.AbilityTypeEnum;
import com.rational.model.equipment.ArmorModel;
import com.rational.model.equipment.EquipmentModel;
import com.rational.model.equipment.WeaponModel;
import org.codehaus.jackson.annotate.JsonManagedReference;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
public class CharacterModel {

    @Id
    @GeneratedValue
    private Long id;
    private String name;
    private Integer level;
    private boolean encumbered;
    private Integer speed = 0;

    @ManyToOne
    private ClassModel clazz;

    @ManyToOne
    private RaceModel race;

    @ManyToOne
    private SubRaceModel subrace;

    @ManyToMany
    @JoinTable(name="character_language",
            joinColumns = @JoinColumn(name="character_id"), inverseJoinColumns = @JoinColumn(name="language_id"))
    private Set<LanguageModel> languages = new HashSet<LanguageModel>();

    @ManyToMany
    @JoinTable(name="character_proficiency",
            joinColumns = @JoinColumn(name="character_id"), inverseJoinColumns = @JoinColumn(name="proficiency_id"))
    private Set<Proficiency> proficiencies = new HashSet<Proficiency>();

    @ManyToMany
    @JoinTable(name="traitmodel_charactermodel",
            joinColumns = @JoinColumn(name="charactermodel_id"), inverseJoinColumns = @JoinColumn(name="traitmodel_id"))
    private Set<TraitModel> traits = new HashSet<TraitModel>();

    private int maxHealth;
    private int currentHealth;

    @ManyToOne
    private Abilities abilities;

    @JsonManagedReference
    @ManyToMany
    @JoinTable(name="character_equipment", joinColumns = @JoinColumn(name="character_id"),
            inverseJoinColumns = @JoinColumn(name="equipment_id"))
    private List<EquipmentModel> inventory = new ArrayList<EquipmentModel>();

    @JsonManagedReference
    @ManyToOne
    private ArmorModel equippedArmor;

    @JsonManagedReference
    @ManyToOne
    private WeaponModel equippedMainHand;

    @JsonManagedReference
    @ManyToOne
    private EquipmentModel equippedOffHand;

    @JsonManagedReference
    @OneToOne(cascade = CascadeType.ALL)
    private CoinPurse coinPurse;

    private Long inventoryWeight;

    public CharacterModel(){}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public RaceModel getRace() {
        return race;
    }

    public void setRace(RaceModel race) {
        this.race = race;
    }

    public ClassModel getClazz() {
        return clazz;
    }

    public void setClazz(ClassModel clazz) {
        this.clazz = clazz;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public int getMaxHealth() {
        return maxHealth;
    }

    public void setMaxHealth(int maxHealth) {
        this.maxHealth = maxHealth;
    }

    public int getCurrentHealth() {
        return currentHealth;
    }

    public void setCurrentHealth(int currentHealth) {
        this.currentHealth = currentHealth;
    }

    public Set<Proficiency> getProficiencies() { return this.proficiencies;}

//    public Set<Proficiency> getAllProficiencies() {
//        Set<Proficiency> allProficiencies = new HashSet<Proficiency>();
//        allProficiencies.addAll(this.proficiencies);
//        allProficiencies.addAll(this.race.getProficiencies());
//        allProficiencies.addAll(this.clazz.getProficiencies());
//        return allProficiencies;
//    }

    public void setProficiencies(Set<Proficiency> proficiencies) {
        this.proficiencies = proficiencies;
    }
    public Set<LanguageModel> getLanguages() {return this.languages;}

//    public Set<LanguageModel> getAllLanguageModels() {
//        Set<LanguageModel> allLanguages = new HashSet<LanguageModel>();
//        allLanguages.addAll(this.languages);
//        allLanguages.addAll(this.race.getLanguages());
//        return allLanguages;
//    }

    public void setLanguages(Set<LanguageModel> languages) {
        this.languages = languages;
    }

    public Set<TraitModel> getTraits() {return this.traits;}


//    public Set<TraitModel> getAllTraits() {
//        Set<TraitModel> allTraits = new HashSet<TraitModel>();
//        allTraits.addAll(this.traits);
//        allTraits.addAll(this.race.getTraits());
//        allTraits.addAll(this.getClazz().getClassTraits());
//        return allTraits;
//    }

    public void setTraits(Set<TraitModel> traits) {
        this.traits = traits;
    }

    public List<EquipmentModel> getInventory() {
        return inventory;
    }

    public void setInventory(List<EquipmentModel> inventory) {
        this.inventory = inventory;
    }

    public ArmorModel getEquippedArmor() {
        return equippedArmor;
    }

    public void setEquippedArmor(ArmorModel equippedArmor) {
        this.equippedArmor = equippedArmor;
    }

    public WeaponModel getEquippedMainHand() {
        return equippedMainHand;
    }

    public void setEquippedMainHand(WeaponModel equippedMainHand) {
        this.equippedMainHand = equippedMainHand;
    }

    public EquipmentModel getEquippedOffHand() {
        return equippedOffHand;
    }

    public void setEquippedOffHand(EquipmentModel equippedOffHand) {
        this.equippedOffHand = equippedOffHand;
    }

    public CoinPurse getCoinPurse() {
        return coinPurse;
    }

    public void setCoinPurse(CoinPurse coinPurse) {
        this.coinPurse = coinPurse;
    }

    public SubRaceModel getSubrace() {
        return subrace;
    }

    public void setSubrace(SubRaceModel subrace) {
        this.subrace = subrace;
    }

    public Long getInventoryWeight() {
        return inventoryWeight;
    }

    public void setInventoryWeight(Long inventoryWeight) {
        this.inventoryWeight = inventoryWeight;
    }

    public boolean isEncumbered() {
        return encumbered;
    }

    public void setEncumbered(boolean encumbered) {
        this.encumbered = encumbered;
    }

//    public Abilities getAbilityByType(AbilityTypeEnum type){
//        switch (type){
//            case Str: return getStr();
//            case Dex: return getDex();
//            case Con: return getCon();
//            case Int: return getIntel();
//            case Wis: return getWis();
//            case Cha: return getCha();
//        }
//        return null;
//    }

    public Integer getSaveDC(){
        if(getClazz() != null && getClazz().getMagicAbility() != null) {
            //TODO add prof Modifier to the save DC
            int saveDC = 8 + abilities.getAbilityScore(AbilityTypeEnum.valueOf(getClazz().getMagicAbility()));
        }
        return null;
    };

    public Integer getSpeed() {
        return speed;
    }

    public void setSpeed(Integer speed) {
        this.speed = speed;
    }

    public Abilities getAbilities() {
        return abilities;
    }

    public void setAbilities(Abilities abilities) {
        this.abilities = abilities;
    }



}
