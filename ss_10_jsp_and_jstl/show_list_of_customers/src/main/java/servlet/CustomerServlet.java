package servlet;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns ="/customer")
public class CustomerServlet extends HttpServlet {

    private static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer("Tuấn", "28/08/1995", "123 Sơn La", "https://www.google.com.vn/imgres?imgurl=https%3A%2F%2Fchandra.harvard.edu%2Fphoto%2F2016%2Fvla%2Fvla_4k.jpg&imgrefurl=https%3A%2F%2Fchandra.harvard.edu%2Fphoto%2F4k_images.html&tbnid=Ub5WkO5xrolG1M&vet=12ahUKEwiYr_HSkbr6AhUxzIsBHarXAtIQMygGegUIARDLAQ..i&docid=wS0j3Tmr0TMLaM&w=4096&h=2160&q=img%204k%20jpg&ved=2ahUKEwiYr_HSkbr6AhUxzIsBHarXAtIQMygGegUIARDLAQ"));
        customerList.add(new Customer("Phong", "28/11/1995", "123 Sơn La", "https://www.google.com.vn/imgres?imgurl=https%3A%2F%2Fimages.pexels.com%2Fphotos%2F1643409%2Fpexels-photo-1643409.jpeg%3Fcs%3Dsrgb%26dl%3Dpexels-visually-us-1643409.jpg%26fm%3Djpg&imgrefurl=https%3A%2F%2Fwww.pexels.com%2Fvi-vn%2Ftim-kiem%2F4k%2F&tbnid=ZVfS6LbZ3wPfZM&vet=12ahUKEwjoyvvEjrr6AhUXx4sBHa0BAb0QMygFegUIARDOAQ..i&docid=HZ_Gve9NfCJJTM&w=6000&h=4000&q=img%204k&ved=2ahUKEwjoyvvEjrr6AhUXx4sBHa0BAb0QMygFegUIARDOAQ"));
        customerList.add(new Customer("Khanh", "28/02/1995", "123 Sơn La", "https://www.google.com.vn/imgres?imgurl=https%3A%2F%2Fimages.pexels.com%2Fphotos%2F1643409%2Fpexels-photo-1643409.jpeg%3Fcs%3Dsrgb%26dl%3Dpexels-visually-us-1643409.jpg%26fm%3Djpg&imgrefurl=https%3A%2F%2Fwww.pexels.com%2Fvi-vn%2Ftim-kiem%2F4k%2F&tbnid=ZVfS6LbZ3wPfZM&vet=12ahUKEwjoyvvEjrr6AhUXx4sBHa0BAb0QMygFegUIARDOAQ..i&docid=HZ_Gve9NfCJJTM&w=6000&h=4000&q=img%204k&ved=2ahUKEwjoyvvEjrr6AhUXx4sBHa0BAb0QMygFegUIARDOAQ"));
        customerList.add(new Customer("Mỹ", "28/05/1995", "123 Sơn La", "https://www.google.com.vn/imgres?imgurl=https%3A%2F%2Fimages.pexels.com%2Fphotos%2F1643409%2Fpexels-photo-1643409.jpeg%3Fcs%3Dsrgb%26dl%3Dpexels-visually-us-1643409.jpg%26fm%3Djpg&imgrefurl=https%3A%2F%2Fwww.pexels.com%2Fvi-vn%2Ftim-kiem%2F4k%2F&tbnid=ZVfS6LbZ3wPfZM&vet=12ahUKEwjoyvvEjrr6AhUXx4sBHa0BAb0QMygFegUIARDOAQ..i&docid=HZ_Gve9NfCJJTM&w=6000&h=4000&q=img%204k&ved=2ahUKEwjoyvvEjrr6AhUXx4sBHa0BAb0QMygFegUIARDOAQ"));
        customerList.add(new Customer("Vinh", "28/08/1995", "123 Sơn La", "https://www.google.com.vn/imgres?imgurl=https%3A%2F%2Fimages.pexels.com%2Fphotos%2F1643409%2Fpexels-photo-1643409.jpeg%3Fcs%3Dsrgb%26dl%3Dpexels-visually-us-1643409.jpg%26fm%3Djpg&imgrefurl=https%3A%2F%2Fwww.pexels.com%2Fvi-vn%2Ftim-kiem%2F4k%2F&tbnid=ZVfS6LbZ3wPfZM&vet=12ahUKEwjoyvvEjrr6AhUXx4sBHa0BAb0QMygFegUIARDOAQ..i&docid=HZ_Gve9NfCJJTM&w=6000&h=4000&q=img%204k&ved=2ahUKEwjoyvvEjrr6AhUXx4sBHa0BAb0QMygFegUIARDOAQ"));
        customerList.add(new Customer("Tân", "03/03/1995", "123 Sơn La", "https://www.google.com.vn/imgres?imgurl=https%3A%2F%2Fimages.pexels.com%2Fphotos%2F1643409%2Fpexels-photo-1643409.jpeg%3Fcs%3Dsrgb%26dl%3Dpexels-visually-us-1643409.jpg%26fm%3Djpg&imgrefurl=https%3A%2F%2Fwww.pexels.com%2Fvi-vn%2Ftim-kiem%2F4k%2F&tbnid=ZVfS6LbZ3wPfZM&vet=12ahUKEwjoyvvEjrr6AhUXx4sBHa0BAb0QMygFegUIARDOAQ..i&docid=HZ_Gve9NfCJJTM&w=6000&h=4000&q=img%204k&ved=2ahUKEwjoyvvEjrr6AhUXx4sBHa0BAb0QMygFegUIARDOAQ"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("/customer/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
