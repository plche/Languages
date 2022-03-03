package com.codingdojo.peru.ft2022.languages.controllers;

import com.codingdojo.peru.ft2022.languages.models.Language;
import com.codingdojo.peru.ft2022.languages.services.LanguageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
public class LanguageController {

    @Autowired
    LanguageService languageService;

    // Ruta GET /languages muestra una tabla de todos los lenguajes con enlaces para editarlos y eliminarlos.
    // También incluye un formulario para la creación de nuevos lenguajes.
    @GetMapping("/languages")
    public String index(Model model, @ModelAttribute("language")Language language) {
        List<Language> languages = languageService.allLanguages();
        model.addAttribute("languages", languages);

        return "index.jsp";
    }

    // Ruta POST /languages crear un idioma.
    @PostMapping("/languages")
    public String saveNewLanguage(@Valid @ModelAttribute("language") Language language, BindingResult result) {
        if (result.hasErrors()) return "index.jsp";
        languageService.createLanguage(language);

        return "redirect:/languages";
    }

    // Ruta GET /languages/{id} devuelve el lenguaje y sus detalles específicos.
    @GetMapping("/languages/{id}")
    public String languageDetail(@PathVariable("id") Long id, Model model) {
        Language language = languageService.findLanguage(id);
        model.addAttribute("language", language);

        return "show.jsp";
    }

    // Ruta GET /languages/{id}/edit muestra la página de edición del lenguaje específico.
    @GetMapping("/languages/{id}/edit")
    public String editALanguage(@PathVariable("id") Long id, Model model) {
        Language language = languageService.findLanguage(id);
        model.addAttribute("language", language);

        return "edit.jsp";
    }

    // Ruta PUT /languages/{id} actualiza un lenguaje específico.
    @PutMapping("/language/{id}")
    public String updateALanguage(@Valid @ModelAttribute("language") Language language, BindingResult result) {
        if (result.hasErrors()) return "edit.jsp";
        else {
            languageService.updateLanguage(language.getId(), language.getName(), language.getCreator(), language.getCurrentVersion());
            return "redirect:/languages";
        }
    }

    // Ruta DELETE /languages/{id} elimina el lenguaje específico.
    @DeleteMapping("/languages/{id}")
    public String destroyALanguage(@PathVariable("id") Long id) {
        languageService.deleteLanguage(id);
        return "redirect:/languages";
    }
}
