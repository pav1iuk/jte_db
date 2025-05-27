package com.example.demo.controller;

import com.example.demo.UserService;
import com.example.demo.dto.UserDto;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RegistrationPageController {
    private final UserService userService;

    public RegistrationPageController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute("userDto") UserDto userDto,
                               BindingResult bindingResult,
                               Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("errors", bindingResult);
            return "register";
        }

        if (userService.existsByUsername(userDto.getUsername())) {
            model.addAttribute("usernameError", "Username already exists");
            return "register";
        }

        userService.createUser(userDto);
        return "redirect:/login";
    }
}
