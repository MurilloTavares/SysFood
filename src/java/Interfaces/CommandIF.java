package Interfaces;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandIF {
    
    // Executa os servicos e retorna o caminho da proxima pagina
    String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException;
    
}
