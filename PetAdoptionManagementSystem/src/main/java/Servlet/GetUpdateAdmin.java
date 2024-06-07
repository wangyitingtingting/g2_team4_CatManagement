package main.java.Servlet;

import com.alibaba.fastjson.JSONObject;
import main.java.Dto.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet("/getUpdateAdmin")
public class GetUpdateAdmin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        List<Admin> admins = (List<Admin>) req.getSession().getAttribute("admins");
        Admin update = new Admin();
        HashMap<String, Object> res = new HashMap<>();
        for (Admin admin : admins) {
            if (admin.getManageId().equals(Long.valueOf(id))) {
                update.setManageId(admin.getManageId());
                update.setManageName(admin.getManageName());
                update.setManagePassword(admin.getManagePassword());
                update.setManageTel(admin.getManageTel());
                update.setManageGender(admin.getManageGender());
                req.getSession().setAttribute("update", update);
            }
        }
        res.put("retCode", 200);
        resp.getWriter().print(JSONObject.toJSONString(res));
    }
}
