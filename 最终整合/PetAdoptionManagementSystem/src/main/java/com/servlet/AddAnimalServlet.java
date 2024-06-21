package com.servlet;

import com.pojo.Animal;
import com.service.impl.AnimalServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.*;



//添加

@WebServlet("/AddAnimalServlet") //连接加动物jsp
public class AddAnimalServlet extends HttpServlet {


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String relpath="imgs";
		String path= req.getSession().getServletContext().getRealPath(relpath);//request.getRealPath(relpath);
		String fn=null;
		DiskFileItemFactory factory=new DiskFileItemFactory();
		ServletFileUpload sfu=new ServletFileUpload(factory);
		sfu.setHeaderEncoding("UTF-8");  //处理中文问题
		sfu.setSizeMax(5*1024*1024);   //限制文件大小
		Map param = new HashMap();
		try {
			List<FileItem> fileItems= sfu.parseRequest(req);  //解码请求 得到所有表单元素
			for (FileItem fi : fileItems) {
				//有可能是 文件，也可能是普通文字
				if (fi.isFormField()) { //这个选项是 文字
					param.put(fi.getFieldName(), fi.getString("utf-8"));//如果你页面编码是utf-8的
					System.out.println("表单值为："+fi.getString());
				}else{
					// 是文件
					//获取图片后缀名
					String format=fi.getName().substring(fi.getName().indexOf("."), fi.getName().length());
					//图片命名
					fn=UUID.randomUUID().toString().replaceAll("-", "")+format;
					System.out.println("文件名是："+fn);  //文件名
					// fn 是可能是这样的 c:\abc\de\tt\fish.jpg
					fi.write(new File(path,fn));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String fimage=relpath+"/"+fn;

	       
	    
	    
	    
        //接收参数
       /* String AnimalName = req.getParameter("AnimalName");
        String AnimalType = req.getParameter("AnimalType");
        String AnimalGender = req.getParameter("AnimalGender");
        String Health = req.getParameter("Health");
        String Age = req.getParameter("Age");
        String PicAnimal = req.getParameter("PicAnimal"); */
		String AnimalName = param.get("AnimalName").toString(); 
		String AnimalType = param.get("AnimalType").toString(); 
		String AnimalGender = param.get("AnimalGender").toString(); 
		String Health = param.get("Health").toString(); 
		int Age = Integer.parseInt(param.get("Age").toString()); 



        //调用
        AnimalServiceImpl AnimalService = new AnimalServiceImpl();
        Animal a = new Animal(); 
        a.setAge(Age);
        a.setAnimalGender(AnimalGender);
        a.setAnimalName(AnimalName);
        a.setAnimalType(AnimalType);
        a.setHealth(Health);
        a.setLYStatus("0");
        a.setPicAnimal(fimage); 


        AnimalService.insertAnimal(a);



        //跳转
        //直接重定向到查询所有信息的servlet
        resp.sendRedirect("QueryAnimalServlet");


    }
}
