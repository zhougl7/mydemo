package service;

import domain.PageBean;
import domain.User;

import java.util.List;
import java.util.Map;

public interface IUserService {
    public List<User> findAll();

    public void addUser(User user);

    public void delUser(String id);

    public User findUserById(String id);

    public void updataUser(User user);

    public void delSelectedUser(String[] ids);

    PageBean<User> finUserByPage(String current, String rows, Map<String, String[]> condition);
}
