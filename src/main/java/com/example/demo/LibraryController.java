package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LibraryController {

    private final ReaderRepository readerRepository;

    public LibraryController(ReaderRepository readerRepository) {
        this.readerRepository = readerRepository;
    }

    @GetMapping("/readers")
    public String showReaders(Model model) {
        model.addAttribute("readers", readerRepository.findAll());
        return "readers";
    }

}

