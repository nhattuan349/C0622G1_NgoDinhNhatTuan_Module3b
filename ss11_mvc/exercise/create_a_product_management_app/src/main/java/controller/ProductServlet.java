package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {

    IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showAddForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                //code
            default:
                showListProduct(request, response);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
        }

    }


    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        request.setAttribute("product",product);
        try {
            request.getRequestDispatcher("/product/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        String production = request.getParameter("production");
        Product product = productService.findById(id);

        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            product.setName(name);
            product.setPrice(price);
            product.setAmount(amount);
            product.setProduction(production);
            productService.edit(id, product);
            request.setAttribute("product",product);
            request.setAttribute("massage","Chỉnh sửa thành công");
            dispatcher = request.getRequestDispatcher("/product/edit.jsp");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        String production = request.getParameter("production");
        int id = (int) (Math.random() * 10000);

        Product product = new Product(id, name, price, amount, production);

        productService.create(product);
        request.setAttribute("mess", "Thêm mới thành công");
        showAddForm(request, response);

    }


    private void showAddForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/product/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = productService.findAll();
        request.setAttribute("products", products);
        try {
            request.getRequestDispatcher("/product/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
