/**
 * Created by awest on 7/23/14.
 */
package com.rational.model.entities;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.annotate.JsonManagedReference;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class RaceModel {

    @Id
    @GeneratedValue
    private Long id;

    private String raceName;

    @JsonBackReference
    @OneToMany(mappedBy = "race", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<CharacterModel> characters;

    @Column(name="description")
    private String description;

    @Column(name="size")
    private String size;

    @Column(name="speed")
    private Integer speed;

    @JsonManagedReference
    @ManyToMany
    private List<LanguageModel> languages = new ArrayList<LanguageModel>();

    @JsonManagedReference
    @ManyToMany
    private List<TraitModel> traits = new ArrayList<TraitModel>();

    @JsonManagedReference
    @OneToMany(mappedBy = "parentRace", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<SubRaceModel> availableSubraces = new ArrayList<SubRaceModel>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRaceName() {
        return raceName;
    }

    public void setRaceName(String raceName) {
        this.raceName = raceName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    public List<LanguageModel> getLanguages() {
        return languages;
    }

    public void setLanguages(List<LanguageModel> languages) {
        this.languages = languages;
    }

//    public List<TraitModel> getTraits() {
//        return traits;
//    }
//
//    public void setTraits(List<TraitModel> traits) {
//        this.traits = traits;
//    }

//    public SubRaceModel getSubrace() {
//        return subRace;
//    }
//
//    public void setSubrace(SubRaceModel subRace) {
//        this.subRace = subRace;
//    }


    public List<SubRaceModel> getAvailableSubraces() {
        return availableSubraces;
    }

    public void setAvailableSubraces(List<SubRaceModel> availableSubraces) {
        this.availableSubraces = availableSubraces;
    }

    public List<TraitModel> getTraits() {
        return traits;
    }

    public void setTraits(List<TraitModel> traits) {
        this.traits = traits;
    }

    public List<CharacterModel> getCharacter() {
        return characters;
    }

    public void setCharacter(List<CharacterModel> characters) {
        this.characters = characters;
    }
}
