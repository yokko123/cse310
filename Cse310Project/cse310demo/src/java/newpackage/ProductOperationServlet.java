/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import static sun.security.krb5.Confounder.bytes;

/**
 *
 * @author yokko
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //servlet
            //add category
            //add product
            String op = request.getParameter("operation");
//            String title = request.getParameter("catTitle");
//            String description = request.getParameter("catDescription");
            if (op.trim().equals("addcategory")) {
                //add category
                //fetching ctegory data
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                Category catModel = new Category(title, description);
                CategoryDatabase catReg = new CategoryDatabase(ConnectionPro.getConnection());
                if (catReg.saveCategory(catModel)) {
                    response.sendRedirect("/cse310demo/admin/admin.jsp");
                }

            } else if (op.trim().equals("addproduct")) {
                //add product
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                
                
                

                Part part = request.getPart("pPic");
                String pPic = part.getSubmittedFileName();
                String path = getServletContext().getRealPath("/" + "product" + File.separator + pPic);
                //String path = request.getRealPath("product") + File.separator+pPic;
                System.out.println("path :" + path);
                InputStream is = part.getInputStream();
                boolean flag = uploadFile(is, path);
                if (flag) {
                    out.println(path);
                } else {
                    out.println("error");
                }

                Product productModel = new Product(pName, pDesc, pPrice, pDiscount, pQuantity, pPic, catId);
                ProductDatabase proReg = new ProductDatabase(ConnectionPro.getConnection());
                

                if (proReg.saveProduct(productModel)) {
                    response.sendRedirect("/cse310demo/admin/admin.jsp");
                } else {
                    String errorMessage = "User Available";
                    HttpSession regSession = request.getSession();
                    regSession.setAttribute("RegError", errorMessage);
                    response.sendRedirect("signup/signup.jsp");
                }

            }
        }

    }

    public boolean uploadFile(InputStream is, String path) throws FileNotFoundException {
        boolean test = false;
        try {

            byte[] byt = new byte[is.available()];
            FileOutputStream fops = new FileOutputStream(path);
            fops.write(byt);
            //fops.flush();
            fops.close();

            test = true;
        } catch (Exception e) {
            e.printStackTrace();

        }

        return test;
    }

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
