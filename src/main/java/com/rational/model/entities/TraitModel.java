package com.rational.model.entities;

import org.codehaus.jackson.annotate.JsonBackReference;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="traits")
public abstract class TraitModel {

    @Id
    @GeneratedValue
    private int id;

    @Column(name="name")
    private String name;

    @JsonBackReference
    @ManyToMany
    @JoinTable(name="race_trait", joinColumns = @JoinColumn(name="race_id"),
            inverseJoinColumns = @JoinColumn(name="trait_id"))
    private List<RaceModel> races= new ArrayList<RaceModel>();

    @JsonBackReference
    @ManyToMany
    @JoinTable(name="subrace_trait", joinColumns = @JoinColumn(name="subrace_id"),
            inverseJoinColumns = @JoinColumn(name="trait_id"))
    private List<SubRaceModel> subRaces= new ArrayList<SubRaceModel>();

    @JsonBackReference
    @ManyToMany
    @JoinTable(name="class_trait", joinColumns = @JoinColumn(name="class_id"),
            inverseJoinColumns = @JoinColumn(name="trait_id"))
    private List<ClassModel> classes= new ArrayList<ClassModel>();

    @JsonBackReference
    @ManyToMany
    @JoinTable(name="subclass_trait", joinColumns = @JoinColumn(name="subclass_id"),
            inverseJoinColumns = @JoinColumn(name="trait_id"))
    private List<SubClassModel> subClasses= new ArrayList<SubClassModel>();

    @JsonBackReference
    @ManyToMany
    private List<CharacterModel> characters = new ArrayList<CharacterModel>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public List<RaceModel> getRaces() {
        return races;
    }

    public void setRaces(List<RaceModel> races) {
        this.races = races;
    }

    public List<SubRaceModel> getSubRaces() {
        return subRaces;
    }

    public void setSubRaces(List<SubRaceModel> subRaces) {
        this.subRaces = subRaces;
    }

    public List<ClassModel> getClasses() {
        return classes;
    }

    public void setClasses(List<ClassModel> classes) {
        this.classes = classes;
    }

    public List<SubClassModel> getSubClasses() {
        return subClasses;
    }

    public void setSubClasses(List<SubClassModel> subClasses) {
        this.subClasses = subClasses;
    }

    public List<CharacterModel> getCharacters() {
        return characters;
    }

    public void setCharacters(List<CharacterModel> characters) {
        this.characters = characters;
    }
}
