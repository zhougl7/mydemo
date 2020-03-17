package dao.impl;

import Utils.JDBCUtil;
import dao.IUserDao;
import domain.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class UserDaoImpl implements IUserDao {
    private JdbcTemplate template= new JdbcTemplate(JDBCUtil.getDataSource());
    @Override
    public List<User> findAll() {
        String sql="select * from user";
        List<User> users = template.query(sql, new BeanPropertyRowMapper<User>(User.class));
        return users;
    }
    public void addUser(User user){
        String sql="insert into user values(?,?,?,?,?)";
        template.update(sql,user.getId(),user.getName(),user.getSex(),user.getQq(),user.getAddress());
    }
    public void delUser(int id){
        String sql="delete from user where id = ?";
        template.update(sql,id);
    }
    public User findUserById(int id){
        String sql="select * from user where id = ? ";
        return template.queryForObject(sql,new BeanPropertyRowMapper<User>(User.class),id);
    }
    public void updataUser(User user){
        String sql="update user set id=?,name=?,sex=?,qq=?,address=? where id =?";
        template.update(sql,user.getId(),user.getName(),user.getSex(),user.getQq(),user.getAddress(),user.getId());
    }

    @Override
    public int finTotalCount(Map<String, String[]> condition) {
        String sql="select count(*) from user where 1 = 1 ";
        StringBuilder sb = new StringBuilder(sql);
        Set<String> keyset = condition.keySet();

        List<Object> params = new ArrayList<Object>();

        for (String key : keyset) {

            if ("current".equals(key) || "rows".equals(key)){
                continue;
            }
            String value = condition.get(key)[0];
            if(value != null && !"".equals(value) ){
                sb.append(" and " + key + " like ? ");
                params.add("%" +value + "%");
            }
        }
        System.out.println(sb.toString());
        System.out.println(params);
        return template.queryForObject(sb.toString(),Integer.class,params.toArray());
    }

    @Override
    public List<User> finByPage(int start, int rows, Map<String, String[]> condition) {
        String sql = "select * from user where 1 = 1 ";

        StringBuilder sb = new StringBuilder(sql);
        Set<String> keyset = condition.keySet();

        List<Object> params = new ArrayList<Object>();

        for (String key : keyset) {
            if ("current".equals(key) || "rows".equals(key) || "username".equals(key) || "password".equals(key) || "checkcode".equals(key)){
                continue;
            }
            String value = condition.get(key)[0];
            if(value != null && !"".equals(value) ){
                sb.append(" and " + key + " like ? ");
                params.add("%" +value + "%");
            }
        }
        sb.append(" limit ?,? ");
        params.add(start);
        params.add(rows);
        return template.query(sb.toString(),new BeanPropertyRowMapper<User>(User.class),params.toArray());
    }
}
