package test;

import dao.IUserDao;
import dao.impl.UserDaoImpl;
import domain.User;

import java.util.List;

public class JDBCTest {
    public static void main(String[] args) {
        IUserDao dao = new UserDaoImpl();
        List<User> all = dao.findAll();
        System.out.println(all);
    }
}
