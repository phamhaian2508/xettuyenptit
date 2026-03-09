package com.javaweb.controller;

import com.javaweb.exception.MyException;
import com.javaweb.model.dto.PasswordDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView root() {
        return new ModelAndView("redirect:/user/login");
    }

    @RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
    public ModelAndView home() {
        return new ModelAndView("redirect:/user/login");
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView oldLogin() {
        return new ModelAndView("redirect:/user/login");
    }

    @RequestMapping(value = {"/user/login", "/user/login/"}, method = RequestMethod.GET)
    public ModelAndView login() {
        return new ModelAndView("login");
    }

    @RequestMapping(value = "/mucdich", method = RequestMethod.GET)
    public ModelAndView mucDich() {
        String username = SecurityUtils.getPrincipal().getUsername();
        UserDTO user = userService.findOneByUserName(username);

        String displayFullName = user != null && user.getFullName() != null && !user.getFullName().trim().isEmpty()
                ? user.getFullName().trim()
                : username;
        String greetingName = user != null && user.getFirstName() != null && !user.getFirstName().trim().isEmpty()
                ? user.getFirstName().trim()
                : displayFullName;

        if (greetingName.contains(" ")) {
            String[] parts = greetingName.trim().split("\\s+");
            greetingName = parts[parts.length - 1];
        }

        ModelAndView mav = new ModelAndView("mucdich");
        mav.addObject("displayFullName", displayFullName);
        mav.addObject("greetingName", greetingName);
        return mav;
    }

    @RequestMapping(value = "/danhsachhoso", method = RequestMethod.GET)
    public ModelAndView danhSachHoSo() {
        String username = SecurityUtils.getPrincipal().getUsername();
        UserDTO user = userService.findOneByUserName(username);
        String displayFullName = user != null && user.getFullName() != null && !user.getFullName().trim().isEmpty()
                ? user.getFullName().trim()
                : username;
        ModelAndView mav = new ModelAndView("danhsachhoso");
        mav.addObject("displayFullName", displayFullName);
        return mav;
    }

    @RequestMapping(value = "/account/center", method = RequestMethod.GET)
    public ModelAndView accountCenter(@RequestParam(value = "saved", required = false) Integer saved,
                                      @RequestParam(value = "pwSaved", required = false) Integer pwSaved,
                                      @RequestParam(value = "pwError", required = false) Integer pwError,
                                      @RequestParam(value = "tab", required = false, defaultValue = "profile") String tab) {
        String username = SecurityUtils.getPrincipal().getUsername();
        UserDTO user = userService.findOneByUserName(username);
        ModelAndView mav = new ModelAndView("accountcenter");
        mav.addObject("userInfo", user);
        mav.addObject("activeTab", tab);
        mav.addObject("saved", saved != null && saved == 1);
        mav.addObject("pwSaved", pwSaved != null && pwSaved == 1);
        mav.addObject("pwError", pwError != null && pwError == 1);
        return mav;
    }

    @RequestMapping(value = "/account/center/save", method = RequestMethod.POST)
    public ModelAndView saveAccountCenter(@ModelAttribute("userInfo") UserDTO userDTO) {
        String username = SecurityUtils.getPrincipal().getUsername();
        userService.updateAccountCenter(username, userDTO);
        return new ModelAndView("redirect:/account/center?saved=1");
    }

    @RequestMapping(value = "/account/center/password", method = RequestMethod.POST)
    public ModelAndView saveAccountPassword(@ModelAttribute PasswordDTO passwordDTO) {
        String username = SecurityUtils.getPrincipal().getUsername();
        UserDTO user = userService.findOneByUserName(username);
        try {
            userService.updatePassword(user.getId(), passwordDTO);
            return new ModelAndView("redirect:/account/center?tab=password&pwSaved=1");
        } catch (MyException ex) {
            return new ModelAndView("redirect:/account/center?tab=password&pwError=1");
        }
    }
}
