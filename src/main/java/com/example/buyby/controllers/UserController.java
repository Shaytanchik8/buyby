package com.example.buyby.controllers;

import com.example.buyby.models.Product;
import com.example.buyby.models.User;
import com.example.buyby.services.ProductService;
import com.example.buyby.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final ProductService productService;
    @GetMapping("/login")
    public String login() {
        return "login";
    }


    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }


    @PostMapping("/registration")
    public String createUser(User user, Model model) {
        if (!userService.createUser(user)) {
            model.addAttribute("errorMessage", "Пользователь с email: " + user.getEmail() + " уже существует");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("user/{id}")
    public String userInfo( @PathVariable Long id, Principal principal, Model model){
        model.addAttribute("user_log", productService.getUserByPrincipal(principal));
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("products", user.getProducts());
        return "user-info";
    }

    @GetMapping("user/{id}/edit")
    public String infoEditUser(@PathVariable Long id, Principal principal, Model model) {
        model.addAttribute("user_log", productService.getUserByPrincipal(principal));
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "user-edit-information";
    }

    @PostMapping("user/{id}/edit_post")
    public String editUser(User user, Principal principal, Model model) throws IOException {
        userService.saveUser(user);

        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "redirect:/";
    }

}