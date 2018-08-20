package dao;

import factory.ConnectionFactory;
import java.io.File;
import model.Usuario;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UsuarioDAO {
    
    public void salvar(Usuario u) throws SQLException, FileNotFoundException{
        
        String sql = "INSERT INTO Usuario(email, senha, nome, foto, cep,"
                + " rua, cidade, estado, numero, sexo, profissao, descricao)"
                + " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        Connection connection = ConnectionFactory.connect();
        PreparedStatement stmt = connection.prepareStatement(sql);
        
        stmt.setString(1, u.getEmail());
        stmt.setString(2, u.getSenha());
        stmt.setString(3, u.getNome());
        
        File foto = u.getFoto();
        if (foto != null){
            FileInputStream fis = new FileInputStream(foto);            
            stmt.setBinaryStream(4, fis, (int)foto.length());
        } else {
            stmt.setNull(4, java.sql.Types.OTHER);
        }
        
        stmt.setString(5, u.getCep());
        stmt.setString(6, u.getRua());
        stmt.setString(7, u.getCidade());
        stmt.setString(8, u.getEstado());
        stmt.setString(9, u.getNumero());
        stmt.setString(10, u.getSexo());
        stmt.setString(11, u.getProfissao());
        stmt.setString(12, u.getDescricao());
        stmt.executeUpdate();
        
        stmt.close();
        connection.close();
        
    }
    
}
