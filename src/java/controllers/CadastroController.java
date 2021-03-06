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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Usuario;

public class CadastroController implements CommandIF{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException {
       
        // Pegando atributos e Validando os dados        
        // <Atributo, Mensagem de Erro>
        Map<String, String> errors = new HashMap<>();        
        
        UsuarioDAO dao = new UsuarioDAO();
        
        String email = request.getParameter("email");
        if(email.isEmpty()){
            errors.put("erroEmail", "Email obrigatório.");
        }
        
        try {
            if(dao.getUser(email) != null){
                errors.put("erroEmail", "Email já cadastrado.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CadastroController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String senha = request.getParameter("senha");
        if(senha.isEmpty()){
            errors.put("erroSenha", "Senha obrigatória.");
        }
        
        String senha2 = request.getParameter("senha2");
        if(senha2.isEmpty() || !senha2.equals(senha)){
            errors.put("erroSenha2", "Senhas diferente.");
        }
        
        String nome = request.getParameter("nome");
        if(nome.isEmpty() || nome.matches("[0-9]+")){
            errors.put("erroNome", "Nome inválido.");
        }
                
        String cep = request.getParameter("cep");
        if(cep.isEmpty()){
            errors.put("erroCep", "Endereco obrigatório.");
        } else {
            if(cep.length() < 8){
                errors.put("erroCep", "CEP incompleto");
            }
        }
        
        String rua = request.getParameter("rua");
        if(rua.isEmpty()){
            errors.put("erroRua", "Endereco obrigatório.");
        }
        
        String cidade = request.getParameter("cidade");
        if(cidade.isEmpty()){
            errors.put("erroCidade", "Endereco obrigatório.");
        }
        
        String estado = request.getParameter("estado");
        if(estado.isEmpty()){
            errors.put("erroEstado", "Endereco obrigatório.");
        }
        
        String numero = request.getParameter("numero");
        if(numero.isEmpty()){
            errors.put("erroNumero", "Endereco obrigatório.");
        }
        
        String sexo = request.getParameter("sexo");
        
        String telefone = request.getParameter("telefone");
        if(telefone.length() > 0 && telefone.length() < 9){
            errors.put("erroTelefone", "Telefone incompleto.");
        }
        
        String profissao = request.getParameter("profissao");
        
        // Caso ha erros de validacao, volta para a pagina com erros
        if(!errors.isEmpty()){
            request.setAttribute("errors", errors);
            return "cadastro.jsp";
        }
        
        // Tentando salvar usuario no banco
        Usuario user = new Usuario(email, senha, nome, null, cep, rua, cidade,
                                   estado, numero, sexo, telefone, profissao, null);
        
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
