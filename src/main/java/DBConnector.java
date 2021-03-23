import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
    private static String dbhost = "jdbc:mysql://localhost/apexlegends";
    private static String user = "root";
    private static String password = "";
    private static Connection conn;

    public static Connection connect() {
        try {
            conn = DriverManager.getConnection(dbhost, user, password);
            System.out.println("Connected");
        } catch (SQLException e) {
            System.out.println("Connection failed");
            e.printStackTrace();
        } finally {
            return conn;
        }
    }
}
