package com.codingdojo.peru.ft2022.languages.services;

import com.codingdojo.peru.ft2022.languages.models.Language;
import com.codingdojo.peru.ft2022.languages.repositories.LanguageRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LanguageService {
    private final LanguageRepository languageRepository;

    public LanguageService(LanguageRepository languageRepository) {this.languageRepository = languageRepository;}

    public List<Language> allLanguages() {return languageRepository.findAll();}

    public Language createLanguage(Language language) {return languageRepository.save(language);}

    public Language findLanguage(Long id) {
        Optional<Language> optionalLanguage = languageRepository.findById(id);
        if (optionalLanguage.isPresent()) return optionalLanguage.get();
        else return null;
    }

    public Language updateLanguage(Long id, String name, String creator, String currentVersion) {
        Language language = new Language(name, creator, currentVersion);
        language.setId(id);
        return languageRepository.save(language);
    }

    public void deleteLanguage(Long id) {languageRepository.deleteById(id);}
}
