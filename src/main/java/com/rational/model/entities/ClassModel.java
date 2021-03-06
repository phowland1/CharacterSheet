package com.rational.model.entities;

import com.rational.model.Dice;
import com.rational.model.Proficiency;
import com.rational.utils.Formatter;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonManagedReference;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by awest on 7/23/14.
 */
@Entity
public class ClassModel {

    @Id @GeneratedValue private Long id;
    private String name;
    private String description;
    private Integer startingWealthDieAmount;
    @Column(name="sub_class_name")private String subclassName;
    @Column(name="skills_at_creation") private Integer skillsAtCreation;
    @Column(name="magic_ability") private String magicAbility;

    @ManyToOne @JsonManagedReference private Dice hitDie;
    @ManyToOne @JsonManagedReference private Dice startingWealthDie;

    @ManyToMany
    @JoinTable(name="classmodel_proficiency", joinColumns = @JoinColumn(name="classes_id"), inverseJoinColumns = @JoinColumn(name="proficiencies_id"))
    private List<Proficiency> proficiencies = new ArrayList<Proficiency>();

    @JsonIgnore @OneToMany
    @JoinTable(name="class_subclass", joinColumns = @JoinColumn(name="class_id"), inverseJoinColumns = @JoinColumn(name = "subclass_id"))
    private List<SubClassModel> subClasses = new ArrayList<SubClassModel>();

    @JoinTable(name="spellmodel_classmodel", joinColumns = @JoinColumn(name="classmodel_id"), inverseJoinColumns = @JoinColumn(name="spellmodel_id"))
    @JsonIgnore
    @ManyToMany private List<SpellModel> spells = new ArrayList<SpellModel>();

    @JsonManagedReference @OneToMany(mappedBy = "clazz", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Level> levels = new ArrayList<Level>();

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

    public Dice getHitDie() {
        return hitDie;
    }

    public void setHitDie(Dice hitDie) {
        this.hitDie = hitDie;
    }

    public List<Proficiency> getProficiencies() {
        return proficiencies;
    }

    public void setProficiencies(List<Proficiency> proficiencies) {
        this.proficiencies = proficiencies;
    }

    public List<SubClassModel> getSubClasses() {
        return subClasses;
    }

    public void setSubClasses(List<SubClassModel> subClasses) {
        this.subClasses = subClasses;
    }

    public Integer getSkillsAtCreation() {
        return skillsAtCreation;
    }

    public void setSkillsAtCreation(Integer skillsAtCreation) {
        this.skillsAtCreation = skillsAtCreation;
    }

    public Integer getStartingWealthDieAmount() {
        return startingWealthDieAmount;
    }

    public void setStartingWealthDieAmount(Integer startingWealthDieAmount) {
        this.startingWealthDieAmount = startingWealthDieAmount;
    }

    public Dice getStartingWealthDie() {
        return startingWealthDie;
    }

    public void setStartingWealthDie(Dice startingWealthDie) {
        this.startingWealthDie = startingWealthDie;
    }

    public List<SpellModel> getSpells() {
        return spells;
    }

    public void setSpells(List<SpellModel> spells) {
        this.spells = spells;
    }
    public String getMagicAbility() {
        return magicAbility;
    }

    public void setMagicAbility(String magicAbility) {
        this.magicAbility = magicAbility;
    }

    public List<Level> getLevels() {
        return levels;
    }

    public void setLevels(List<Level> levels) {
        this.levels = levels;
    }

    public Level getLevel(int num){
        for(Level level : levels){
            if(level.getLevelNumber() == num) return level;
        }
        return null;
    }
    public List<Long> getSpellIds(){
        List<Long> spellIds = new ArrayList<Long>();
        for(SpellModel spell :spells){
            spellIds.add(spell.getId());
        }
        return spellIds;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = "<table><tr><td><span>" + Formatter.formatParagraph(description) + "</span></td></tr></table>";
    }

    public String getSubclassName() {
        return subclassName;
    }

    public void setSubclassName(String subclassName) {
        this.subclassName = subclassName;
    }
}
