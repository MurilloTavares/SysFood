package dao;

import factory.ConnectionFactory;
import java.io.File;
import model.Usuario;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.Crypt;

public class UsuarioDAO {

    public void salvar(Usuario u) throws SQLException, FileNotFoundException {

        String sql = "INSERT INTO Usuario(email, senha, nome, foto, cep, rua,"
                + " cidade, estado, numero, sexo, telefone, profissao, descricao)"
                + " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        Connection connection = ConnectionFactory.connect();
        PreparedStatement stmt = connection.prepareStatement(sql);

        stmt.setString(1, u.getEmail());
        stmt.setString(2, Crypt.encrypt(u.getSenha()));
        stmt.setString(3, u.getNome());

        // Caso foto == null, salva foto default
        File foto = u.getFoto();
        InputStream is;
        if (foto == null) {
            is = getClass().getResourceAsStream("../resources/img/defaultProfilePic.png");
        } else {
            is = new FileInputStream(foto);
        }

        stmt.setBinaryStream(4, is);

        stmt.setString(5, u.getCep());
        stmt.setString(6, u.getRua());
        stmt.setString(7, u.getCidade());
        stmt.setString(8, u.getEstado());
        stmt.setString(9, u.getNumero());
        stmt.setString(10, u.getSexo());
        stmt.setString(11, u.getTelefone());
        stmt.setString(12, u.getProfissao());
        stmt.setString(13, u.getDescricao());
        stmt.executeUpdate();

        stmt.close();
        connection.close();
    }

    public Usuario getUser(String email) throws SQLException {

        String sql = "SELECT email, senha, nome, foto, cep, rua, cidade, estado,"
                + " numero, sexo, telefone, profissao, descricao FROM Usuario"
                + " WHERE email = ?";

        Connection connection = ConnectionFactory.connect();
        PreparedStatement stmt = connection.prepareStatement(sql);

        stmt.setString(1, email);
        ResultSet result = stmt.executeQuery();

        Usuario user = null;
        if (result.next()) {
            user = new Usuario(
                    result.getString("email"),
                    result.getString("senha"),
                    result.getString("nome"),
                    bytesToFile(result.getBytes("foto"), "../resources/img/profilePic.png"),
                    result.getString("cep"),
                    result.getString("rua"),
                    result.getString("cidade"),
                    result.getString("estado"),
                    result.getString("numero"),
                    result.getString("sexo"),
                    result.getString("telefone"),
                    result.getString("profissao"),
                    result.getString("descricao"));
        }

        stmt.close();
        connection.close();

        return user;

    }

    public Usuario userValidate(String email, String senha) throws SQLException, IOException {

        Usuario user = getUser(email);
        
        if (Crypt.checkPassword(senha, user.getSenha())) {
            return user;
        } else {
            return null;
        }

    }

    private File bytesToFile(byte[] bytes, String path) {
        
        URL url = getClass().getResource(path);
        File file = new File(url.getPath());
        
        try {
            file.createNewFile();
        } catch (IOException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        try (FileOutputStream fos = new FileOutputStream(file)) {

            fos.write(bytes);

        } catch (FileNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return file;
    }

}
