package com.rational.service.impl;

import com.rational.model.entities.LanguageModel;
import com.rational.repository.LanguageRepository;
import com.rational.service.LanguageService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service("defaultLanguageService")
public class DefaultLanguageService implements LanguageService {

    @Resource
    private LanguageRepository languageRepository;

    @Transactional
    public LanguageModel saveLanguage(LanguageModel language) {return languageRepository.save(language);}

    public LanguageModel findLanguage(Long id) {
        return languageRepository.findOne(id);
    }

    public List<LanguageModel> findAllLanguages() {
        return languageRepository.findAll();
    }
}
