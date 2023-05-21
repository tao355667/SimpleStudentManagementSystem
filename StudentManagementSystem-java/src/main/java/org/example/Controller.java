package org.example;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.google.gson.Gson;
import org.example.mapper.StudentMapper;
import org.example.mapper.UserMapper;
import org.example.pojo.Student;
import org.example.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


@RestController
@SuppressWarnings("all")
@CrossOrigin(origins = {"*", "null"})//解决跨域（8080端口和8081端口）问题
//@RequestMapping(value = "/*",method = {RequestMethod.GET,RequestMethod.POST})//使springboot能接收请求也能发送请求
@RequestMapping(value = "/*", method = {RequestMethod.POST, RequestMethod.GET, RequestMethod.DELETE, RequestMethod.HEAD, RequestMethod.PUT, RequestMethod.OPTIONS, RequestMethod.PATCH, RequestMethod.TRACE})
//使springboot能接收所有类型请求
public class Controller {

    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private UserMapper userMappper;
    private Gson gson = new Gson();

    @GetMapping("/students")
    public String getStudents() {
        List<Student> students = studentMapper.selectList(null);
        return gson.toJson(students);//返回一份json字符串
    }

    @PostMapping("/delete")
    public void deleteStudent(@RequestBody Student student) {
        System.out.print("删除学生：");
        System.out.println(student);
        studentMapper.deleteById(student);//删除一个学生
    }

    @PostMapping("/update")
    public void updateStudent(@RequestBody Student student) {
        System.out.print("更新学生：");
        System.out.println(student);
        studentMapper.updateById(student);//更新一个学生的信息
    }

    @PostMapping("/add")
    public void addStudent(@RequestBody Student student) {
        System.out.print("添加学生：");
        System.out.println(student);
        studentMapper.insert(student);//接收1个json消息，插入1个学生
    }

    @PostMapping("/login")
    public String loginStudent(@RequestBody User user) {
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
        userQueryWrapper.setEntity(user);
        User userSelected = userMappper.selectOne(userQueryWrapper);
        if (userSelected == null) {
            return "账号或密码错误";
        }
        return "登录成功";
    }

    @PostMapping("/register")
    public String register(@RequestBody User user) {
        System.out.print("添加用户：");
        System.out.println(user);
        int s = userMappper.insert(user);
        boolean b = s != 0;
        if (b) {
            return "注册成功";
        } else {
            return "注册失败";
        }
    }

    @PostMapping("/search")
    public String search(@RequestBody HashMap<String, String> data) {
        System.out.println(data);
        List<Student> students = new ArrayList<>();
        QueryWrapper<Student> studentQueryWrapper = new QueryWrapper<>();
        if (data.get("control").equals("number")) {
            String number = data.get("data");
            studentQueryWrapper.like("number", number);//select * from student where name like '%李%'
            students = studentMapper.selectList(studentQueryWrapper);
        }
        if (data.get("control").equals("name")) {
            System.out.println("control==name");
            String name = data.get("data");
            studentQueryWrapper.like("name", name);//select * from student where name like '%李%'
            students = studentMapper.selectList(studentQueryWrapper);
        }
        if (data.get("control").equals("sex")) {
            studentQueryWrapper.like("sex", data.get("data"));//select * from student where name like '%李%'
            students = studentMapper.selectList(studentQueryWrapper);
        }
        if (data.get("control").equals("age")) {
            studentQueryWrapper.like("age", data.get("data"));//select * from student where name like '%李%'
            students = studentMapper.selectList(studentQueryWrapper);
        }
        if (data.get("control").equals("department")) {
            studentQueryWrapper.like("department", data.get("data"));//select * from student where name like '%李%'
            students = studentMapper.selectList(studentQueryWrapper);
        }
        if (data.get("control").equals("classes")) {
            studentQueryWrapper.like("classes", data.get("data"));//select * from student where name like '%李%'
            students = studentMapper.selectList(studentQueryWrapper);
        }

        System.out.print("查询学生信息：");
        System.out.println(students);
        return gson.toJson(students);
    }
}
