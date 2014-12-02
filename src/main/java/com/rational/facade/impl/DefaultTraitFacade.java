package com.rational.facade.impl;

import com.rational.facade.TraitFacade;
import com.rational.model.entities.CharacterModel;
import com.rational.model.entities.TraitModel;
import com.rational.service.TraitService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component("defaultTraitFacade")
public class DefaultTraitFacade implements TraitFacade {

    @Resource(name = "defaultTraitService")
    private TraitService traitService;

    @Override
    public void saveTrait(TraitModel trait) {
        traitService.saveTrait(trait);
    }

    @Override
    public TraitModel findTrait(Long id) {
        return traitService.findTrait(id);
    }

    @Override
    public List<TraitModel> findAllTraits() {
        return traitService.findAllTraits();
    }

    @Override
    public List<TraitModel> findAllRacialTraits() {
        return traitService.findAllTraits();
    }

    @Override
    public List<TraitModel> findAllSubRacialTraits() {
        return traitService.findAllTraits();
    }

    @Override
    public void applyTraits(CharacterModel character, List<TraitModel> traits) {
        for(TraitModel trait : traits){
            trait.applyTrait(character);
        }
    }

    @Override
    public void processTraits(CharacterModel character) {
        for(TraitModel trait : character.getTraits()){
            trait.processTrait(character);
        }
    }
}