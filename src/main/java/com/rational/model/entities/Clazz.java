package com.rational.model.entities;

import com.rational.model.Proficiency;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by awest on 7/23/14.
 */
@Entity
@Table(name="classes")
public class Clazz {

    @Id
    @GeneratedValue
    private Long id;

    @Column(name="name")
    private String name;

    @Column(name="hit_die")
    private String hitDie;

    @ManyToMany
    private List<Proficiency> proficiencies = new ArrayList<Proficiency>();

    @ManyToMany
    private List<ClassTrait> classTraits = new ArrayList<ClassTrait>();

    @OneToMany(mappedBy = "clazz", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<SubClazz> subClasses = new ArrayList<SubClazz>();

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

    public String getHitDie() {
        return hitDie;
    }

    public void setHitDie(String hitDie) {
        this.hitDie = hitDie;
    }

    public List<Proficiency> getProficiencies() {
        return proficiencies;
    }

    public void setProficiencies(List<Proficiency> proficiencies) {
        this.proficiencies = proficiencies;
    }

    public List<ClassTrait> getClassTraits() {
        return classTraits;
    }

    public void setClassTraits(List<ClassTrait> classTraits) {
        this.classTraits = classTraits;
    }

    public List<SubClazz> getSubClasses() {
        return subClasses;
    }

    public void setSubClasses(List<SubClazz> subClasses) {
        this.subClasses = subClasses;
    }
}
