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
public class ProductController {
    private final ProductService productService;
    private final UserService userService;

    @GetMapping("/")
    public String products(@RequestParam(name = "title", required = false) String title, Principal principal, Model model) {
        model.addAttribute("products", productService.listProducts(title));
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "products";
    }

    @GetMapping("/product/{id}")
    public String productInfo(@RequestParam(name = "title", required = false) String title, @PathVariable Long id, Model model,  Principal principal) {
        Product product = productService.getProductById(id);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("products", productService.listProducts(title));
        model.addAttribute("product", product);
        model.addAttribute("images", product.getImages());
        return "product-info";
    }

    @GetMapping ("user/{id}/product/create")
        public String infoCreate(@PathVariable Long id, Principal principal, Model model){
        model.addAttribute("user_log", productService.getUserByPrincipal(principal));
        User user = userService.getUserById(id);
            return "product-create";
        }

    @PostMapping("product/create_post")
    public String createProduct(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3, Product product, Principal principal, Model model) throws IOException {
        productService.saveProduct(principal, product, file1, file2, file3);
        model.addAttribute("user", productService.getUserByPrincipal(principal));

        return "redirect:/";
    }


    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return "redirect:/";
    }

    @GetMapping("product/{id}/edit")
    public String infoEditUser(@PathVariable Long id, Principal principal, Model model) {
        model.addAttribute("user_log", productService.getUserByPrincipal(principal));
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "product-edit";
    }

    @PostMapping("product/{id}/edit_post")
    public String editUser(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                           @RequestParam("file3") MultipartFile file3, Product product, Principal principal, Model model) throws IOException {
        productService.saveProduct(principal, product, file1, file2, file3);

        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "redirect:/";
    }

}