package com.rational.converters;

import com.rational.facade.AdminFacade;
import com.rational.forms.Character;
import com.rational.model.entities.CharacterModel;
import com.rational.model.enums.AbilityTypeEnum;
import com.rational.service.AdminService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class CharacterConverter {

    @Resource
    AdminService adminService;

    @Resource
    AdminFacade adminFacade;

    @Resource
    RaceConverter raceConverter;

    @Resource
    ClassConverter classConverter;

    @Resource
    LanguageConverter languageConverter;

    @Resource
    ProficiencyConverter proficiencyConverter;

    public Character convert(CharacterModel characterModel) {
        Character character = new Character();

        character.setId(characterModel.getId());
        character.setName(characterModel.getName());
        character.setRace(characterModel.getRace().getId());
        character.setClazz(characterModel.getClazz().getId());
        character.setLevel(characterModel.getLevel());
        character.setMaxHealth(characterModel.getMaxHealth());
        character.setCurrentHealth(characterModel.getCurrentHealth());
        Map<AbilityTypeEnum, Integer> abilityScores = new HashMap<AbilityTypeEnum, Integer>();
        abilityScores.put(AbilityTypeEnum.Str, characterModel.getStr());
        abilityScores.put(AbilityTypeEnum.Dex, characterModel.getDex());
        abilityScores.put(AbilityTypeEnum.Con, characterModel.getCon());
        abilityScores.put(AbilityTypeEnum.Int, characterModel.getIntel());
        abilityScores.put(AbilityTypeEnum.Wis, characterModel.getWis());
        abilityScores.put(AbilityTypeEnum.Cha, characterModel.getCha());
        character.setAbilityScores(abilityScores);

        character.setLanguages(languageConverter.convertToIds(characterModel.getLanguageModels()));
        character.setProficiencies(proficiencyConverter.convertToIds(characterModel.getProficiencies()));

        return character;
    }

    public CharacterModel convert(Character character) {
        CharacterModel characterModel = new CharacterModel();

        characterModel.setId(character.getId());
        characterModel.setName(character.getName());
        characterModel.setRace(adminService.findRace(character.getRace()));
        characterModel.setClazz(adminService.findClass(character.getClazz()));
        characterModel.setLevel(character.getLevel());
        characterModel.setMaxHealth(character.getMaxHealth());
        characterModel.setCurrentHealth(character.getCurrentHealth());
        characterModel.setStr(character.getAbilityScores().get(AbilityTypeEnum.Str));
        characterModel.setDex(character.getAbilityScores().get(AbilityTypeEnum.Dex));
        characterModel.setCon(character.getAbilityScores().get(AbilityTypeEnum.Con));
        characterModel.setIntel(character.getAbilityScores().get(AbilityTypeEnum.Int));
        characterModel.setWis(character.getAbilityScores().get(AbilityTypeEnum.Wis));
        characterModel.setCha(character.getAbilityScores().get(AbilityTypeEnum.Cha));

        characterModel.setProficiencies(proficiencyConverter.convertToModels(character.getProficiencies()));
        characterModel.setLanguageModels(languageConverter.convertToModels(character.getLanguages()));

        return characterModel;
    }

    public List<Character> convertToForms(List<CharacterModel> allCharacters) {
        List<Character> characters = new ArrayList<Character>();

        for(CharacterModel characterModel : allCharacters){
            characters.add(convert(characterModel));
        }

        return characters;
    }

    public List<CharacterModel> convertToModels(List<Character> allCharacters) {
        List<CharacterModel> characterModels = new ArrayList<CharacterModel>();

        for(Character character : allCharacters){
            characterModels.add(convert(character));
        }

        return characterModels;
    }
}
