package com.example.buyby.controllers;

import com.example.buyby.models.User;
import com.example.buyby.models.enums.Role;
import com.example.buyby.services.UserService;
import jakarta.persistence.PrePersist;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@RequiredArgsConstructor
@Controller
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
    private final UserService userService;

    @GetMapping("/admin")
    public String admin(Model model){
        model.addAttribute("users", userService.list());
        return "admin";
    }

    @PostMapping("/user/ban/{id}")
    public String userBan(@PathVariable("id") Long id){
        userService.banUser(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/user/edit/{user}")
    public String userEdit(@PathVariable("user") User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "user-edit";
    }

    @PostMapping("/admin/user/edit")
    public String userEdit(@RequestParam("userId") User user, @RequestParam Map<String, String> form) {
        userService.changeUserRoles(user, form);
        return "redirect:/admin";
    }
}
