package util;

import org.mindrot.jbcrypt.BCrypt;

public class Crypt {

    private static final int rounds = 12;

    public static String encrypt(String password_plaintext) {
        String salt = BCrypt.gensalt(rounds);
        String hashed_password = BCrypt.hashpw(password_plaintext, salt);

        return (hashed_password);
    }

    public static boolean checkPassword(String password_plaintext, String stored_hash) {
        boolean password_verified = false;

        if (null == stored_hash || !stored_hash.startsWith("$2a$")) {
            throw new java.lang.IllegalArgumentException("Hash Inválida.");
        }

        password_verified = BCrypt.checkpw(password_plaintext, stored_hash);

        return password_verified;
    }

}
