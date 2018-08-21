package controllers;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Interfaces.CommandIF;
import dao.UsuarioDAO;
import java.io.FileNotFoundException;
import java.sql.SQLException;
import model.Usuario;

public class CadastroController implements CommandIF{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException {
       
        // Pegando atributos e Validando os dados        
        // <Atributo, Mensagem de Erro>
        Map<String, String> errors = new HashMap<>();
        
        String email = request.getParameter("email");
        if(email.isEmpty()){
            errors.put("erroEmail", "Email obrigatório.");
        }
        
        String senha = request.getParameter("senha");
        if(senha.isEmpty()){
            errors.put("erroSenha", "Senha obrigatória.");
        }
        
        String senha2 = request.getParameter("senha2");
        if(senha2.isEmpty() || !senha2.equals(senha)){
            errors.put("erroSenha2", "As senhas não são iguais.");
        }
        
        String nome = request.getParameter("nome");
        if(nome.isEmpty() || nome.matches("[0-9]+")){
            errors.put("erroNome", "Nome inválido.");
        }
                
        String cep = request.getParameter("cep");
        String rua = request.getParameter("rua");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String numero = request.getParameter("numero");
        
        if(cep.isEmpty() || rua.isEmpty() || cidade.isEmpty() || 
                estado.isEmpty() || numero.isEmpty()){
            
            errors.put("erroEndereco", "Endereço obrigatório.");
            
        }
        
        String sexo = request.getParameter("sexo");
        
        String telefone = request.getParameter("telefone");
        
        String profissao = request.getParameter("profissao");
        
        // Caso ha erros de validacao, volta para a pagina com erros
        if(!errors.isEmpty()){
            request.setAttribute("errors", errors);
            return "cadastro.jsp";
        }
        
        // Tentando salvar usuario no banco
        Usuario user = new Usuario(email, senha, nome, null, cep, rua, cidade,
                                   estado, numero, sexo, telefone, profissao, null);
        
        UsuarioDAO dao = new UsuarioDAO();
        
        try {
            dao.salvar(user);
        } catch (SQLException | FileNotFoundException ex) {
            errors.put("erroCadastro", "Ocorreu um erro ao salvar o usuario.");
            System.out.println(ex.getMessage());
            
            return "cadastro.jsp";
        }
                
        // Sucesso ao salvar o usuario
        return "login.jsp";    
        
    }
    
}
