package servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Interfaces.CommandIF;
import controllers.*;

@WebServlet(name = "main", urlPatterns = {"/main"})
public class FrontController extends HttpServlet {
    
    private Map<String, CommandIF> commandMap = new HashMap<>();

    @Override
    public void init() throws ServletException {
        commandMap.put("cadastro", new CadastroController());
        commandMap.put("login", new LoginController());
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        String action = request.getParameter("action");
        String next = null;
        
        // Busca por command referente a action
        try {
            
            CommandIF command = commandMap.get(action);
            next = command.execute(request, response);
            
        } catch (ServletException e) {
            request.setAttribute("msgErro", e.getMessage());
        }
        
        request.getRequestDispatcher(next).forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
