/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author Predator
 */
import Service.Library;
import model.User;
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO extends DBContext {

    public User login(String user_name, String password) {
        try {
            // Câu lệnh SQL kiểm tra user_name và password
            String sql = "SELECT * FROM user WHERE user_name = ? AND password = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, user_name);
            ps.setString(2, password);
            rs = ps.executeQuery();

            // Nếu tìm thấy người dùng, trả về đối tượng User
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setFullName(rs.getString("full_name"));
                u.setUserName(rs.getString("user_name"));
                u.setPassword(rs.getString("password"));
                u.setRoleId(rs.getInt("role_id"));
                return u;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean addUser(User user) {
        try {
            String sql = "INSERT INTO user (full_name, user_name, email, password, role_id, dept_id, status) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)";

            String hashPassword = Library.hashPassword(user.getPassword());
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getUserName());
            ps.setString(3, user.getEmail());
            ps.setString(4, hashPassword);
            ps.setInt(5, user.getRoleId());
            ps.setInt(6, user.getDep_id());
            ps.setBoolean(7, user.getStatus());

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList<User> listUser() {
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "    u.user_id, \n"
                    + "    u.full_name, \n"
                    + "    u.user_name, \n"
                    + "    s.name AS department_name, \n"
                    + "    ss.name AS role_name, \n"
                    + "    u.status,\n"
                    + "    COUNT(p.project_id) AS project_count  \n"
                    + "FROM \n"
                    + "    user u\n"
                    + "JOIN \n"
                    + "    setting s ON s.setting_id = u.dept_id\n"
                    + "JOIN \n"
                    + "    setting ss ON ss.setting_id = u.role_id\n"
                    + "LEFT JOIN \n"
                    + "    project p ON p.dept_id = u.dept_id\n"
                    + "GROUP BY \n"
                    + "    u.user_id, \n"
                    + "    u.full_name, \n"
                    + "    u.user_name, \n"
                    + "    department_name, \n"
                    + "    role_name, \n"
                    + "    u.status";

            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setFullName(rs.getString("full_name"));
                u.setUserName(rs.getString("user_name"));
                u.setDepartmentName(rs.getString("department_name"));
                u.setRoleName(rs.getString("role_name"));
                u.setStatus(rs.getBoolean("status"));
                u.setProjectCount(rs.getInt("project_count"));
                list.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean register(User user) {
        String sql = "INSERT INTO user (full_name, user_name, password, email) VALUES (?, ?, ?, ?)";
        try {
            String hashPassword = Library.hashPassword(user.getPassword());
            ps = connection.prepareStatement(sql);
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getUserName());
            ps.setString(3, hashPassword);
            ps.setString(4, user.getEmail());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateUser(int user_id, String full_name, String user_name, String email, int role_id, int dept_id, boolean status) {
        String sql = "UPDATE user SET full_name = ?, user_name = ?, email = ?, role_id = ?, dept_id = ?, status = ? WHERE user_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, full_name);
            ps.setString(2, user_name);
            ps.setString(3, email);
            ps.setInt(4, role_id);
            ps.setInt(5, dept_id);
            ps.setBoolean(6, status);
            ps.setInt(7, user_id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public User getUserById(int userId) {
        User user = null;
        String sql = "SELECT user_id, full_name, user_name, email, role_id, dept_id, status FROM user WHERE user_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setUserName(rs.getString("user_name"));
                user.setEmail(rs.getString("email"));
                user.setRoleId(rs.getInt("role_id"));
                user.setDep_id(rs.getInt("dept_id"));
                user.setStatus(rs.getBoolean("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public ArrayList<User> sortAndSearchUser(String department, String sortOrder) {
        ArrayList<User> list = new ArrayList<>();
        try {
            // Bắt đầu câu lệnh SQL
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT \n")
                    .append("    u.user_id, \n")
                    .append("    u.full_name, \n")
                    .append("    u.user_name, \n")
                    .append("    s.name AS department_name, \n")
                    .append("    ss.name AS role_name, \n")
                    .append("    u.status,\n")
                    .append("    COUNT(p.project_id) AS project_count  \n")
                    .append("FROM \n")
                    .append("    user u\n")
                    .append("JOIN \n")
                    .append("    setting s ON s.setting_id = u.dept_id\n")
                    .append("JOIN \n")
                    .append("    setting ss ON ss.setting_id = u.role_id\n")
                    .append("LEFT JOIN \n")
                    .append("    project p ON p.dept_id = u.dept_id\n");

            // Kiểm tra nếu department không rỗng
            if (department != null && !department.trim().isEmpty()) {
                sql.append("WHERE s.name LIKE ? \n");
            }

            sql.append("GROUP BY \n")
                    .append("    u.user_id, \n")
                    .append("    u.full_name, \n")
                    .append("    u.user_name, \n")
                    .append("    department_name, \n")
                    .append("    role_name, \n")
                    .append("    u.status");

            // Thêm sắp xếp nếu có yêu cầu
            if (sortOrder != null && !sortOrder.isEmpty()) {
                if ("asc".equalsIgnoreCase(sortOrder)) {
                    sql.append(" ORDER BY project_count ASC");  // Sắp xếp tăng dần
                } else if ("desc".equalsIgnoreCase(sortOrder)) {
                    sql.append(" ORDER BY project_count DESC"); // Sắp xếp giảm dần
                }
            }

            ps = connection.prepareStatement(sql.toString());

            // Thiết lập giá trị cho tham số department nếu có
            if (department != null && !department.trim().isEmpty()) {
                ps.setString(1, "%" + department + "%");
            }

            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setFullName(rs.getString("full_name"));
                u.setUserName(rs.getString("user_name"));
                u.setDepartmentName(rs.getString("department_name"));
                u.setRoleName(rs.getString("role_name"));
                u.setStatus(rs.getBoolean("status"));
                u.setProjectCount(rs.getInt("project_count"));
                list.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean updateUserStatus(int userId, boolean newStatus) {
        String sql = "UPDATE user SET status = ? WHERE user_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setBoolean(1, newStatus);
            ps.setInt(2, userId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu cập nhật thành công
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        //System.out.println(dao.login("johndoe", "123"));
        //User user = new User("", userName, email, password, 0, 0, true)
        //System.out.println(dao.addUser(user));
        ArrayList<User> list = new ArrayList<>();
        //System.out.println(dao.sortAndSearchUser("", "asc"));
        //System.out.println(dao.register(new User("bb", "bb", "bb@gmail.com", "bb")));
        //System.out.println(dao.updateUser(29, "cc", "ac", "cc@gmail.com", 16, 19, true));
        System.out.println(dao.updateUserStatus(29, true));
    }
}
