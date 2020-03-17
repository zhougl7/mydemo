package dao;

import domain.User;

import java.util.List;
import java.util.Map;

public interface IUserDao {
    public List<User> findAll();
    public void addUser(User user);
    public void delUser(int id);
    public User findUserById(int id);
    public void updataUser(User user);

    int finTotalCount(Map<String, String[]> condition);

    List<User> finByPage(int start, int rows, Map<String, String[]> condition);
}
