package service.impl;

import dao.IUserDao;
import dao.impl.UserDaoImpl;
import domain.PageBean;
import domain.User;
import service.IUserService;

import java.util.List;
import java.util.Map;

public class UserServiceImpl implements IUserService {
    IUserDao dao = new UserDaoImpl();
    @Override
    public List<User> findAll() {
        return dao.findAll();
    }

    public void addUser(User user){
        dao.addUser(user);
    }

    public void delUser(String id){
        dao.delUser(Integer.parseInt(id));
    }

    public User findUserById(String id){
        return dao.findUserById(Integer.parseInt(id));
    }

    public void updataUser(User user){
        dao.updataUser(user);
    }

    @Override
    public void delSelectedUser(String[] ids) {
        for (String id : ids) {
            dao.delUser(Integer.parseInt(id));
        }
    }

    @Override
    public PageBean<User> finUserByPage(String _current, String _rows, Map<String, String[]> condition) {
        int totalPage;
        int rows=Integer.parseInt(_rows);
        int current=Integer.parseInt(_current);
        if(current <1){
            current = 1;
        }

        PageBean<User> pb= new PageBean<User>();

        pb.setCurrentPage(current);
        pb.setRows(rows);
        IUserDao dao = new UserDaoImpl();
        int count = dao.finTotalCount(condition);
        pb.setTotalCount(count);
        int start = (current-1)*rows;
        List<User> list = dao.finByPage(start,rows,condition);
        pb.setList(list);

        if(count % 5 == 0){
            totalPage=count/rows;
        }else {
            totalPage=count/rows+1;
        }
        pb.setTotalPage(totalPage);


        return pb;
    }

}
