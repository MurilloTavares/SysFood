package controllers;

import Interfaces.CommandIF;
import dao.UsuarioDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;

public class LoginController implements CommandIF{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        
        UsuarioDAO dao = new UsuarioDAO();
        
        Usuario user = null;
        try {
            user = dao.userValidate(email, senha);
        } catch (SQLException | IOException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if(user != null){
            request.getSession().setAttribute("usuario", user);
            System.out.println("--- USUARIO LOGADO ---");
            System.out.println(user);
            return "home.jsp";
        } else {
            return "login.jsp";
        }
        
    }
    
}
