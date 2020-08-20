package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.data.AptInfoListPage;
import com.ssafy.happyhouse.model.HouseInfoDTO;
import com.ssafy.happyhouse.model.Paging;
import com.ssafy.happyhouse.model.SidoCodeDTO;
import com.ssafy.happyhouse.service.SelectBoxService;

//import com.ssafy.happyhouse.data.AptInfoListPage;
//import com.ssafy.happyhouse.dto.HouseInfoDTO;
//import com.ssafy.happyhouse.dto.Paging;
//import com.ssafy.happyhouse.dto.SidoCodeDTO;
//import com.ssafy.happyhouse.service.FSelectBoxService;

@RestController
@RequestMapping("/FSelectBoxController")
public class SelectBoxController {
   
   @Autowired
   private SelectBoxService service;
   
   @RequestMapping("/sido")
   protected ResponseEntity<List<SidoCodeDTO>> sido() throws ServletException, IOException {
      ArrayList<SidoCodeDTO> list = null;
      try {
         list = service.selectSido();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return new ResponseEntity<List<SidoCodeDTO>>(list, HttpStatus.OK);
   }//process
   
   @RequestMapping("/gugun/{sido}")
   protected ResponseEntity<List<SidoCodeDTO>> gugun(@PathVariable("sido") String sido) throws ServletException, IOException {
      ArrayList<SidoCodeDTO> list = null;
      try {
         list = service.selectGugun(sido);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return new ResponseEntity<List<SidoCodeDTO>>(list, HttpStatus.OK);
   }//process
   
   
   @RequestMapping("/dong/{gugun}")
   protected ResponseEntity<List<HouseInfoDTO>> process(@PathVariable("gugun") String gugun) throws ServletException, IOException {
      ArrayList<HouseInfoDTO> list = null;
      try {
         list = service.selectDong(gugun);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return new ResponseEntity<List<HouseInfoDTO>>(list, HttpStatus.OK);
   }//process
   
   
   @RequestMapping("/apt/{dong}")
   protected ResponseEntity<AptInfoListPage> dong(@PathVariable("dong") String dong, Model model) throws ServletException, IOException {
      ArrayList<HouseInfoDTO> list = null;
      StringBuilder res = new StringBuilder();
      Paging paging = new Paging();
      AptInfoListPage data = new AptInfoListPage();
      try {
         list = service.selectApt(dong);
         paging.setTotalCount(service.getCount(dong));
         data.setList(list);
         data.setPaging(paging);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return new ResponseEntity<AptInfoListPage>(data, HttpStatus.OK);
   }//process
   

}