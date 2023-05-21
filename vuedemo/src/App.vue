<template>
  <div id="app">
    <!-- <div>{{ getStudent() }}</div> -->
    <div class="col-8 offset-2">
      <table class="table table-striped caption-top">
        <caption class="text-center">
          <h1>学生信息管理系统</h1>
          <el-button type="warning" plain @click="dialogVisiblelogin = true">登录</el-button>
          <el-dialog title="提示" :visible.sync="dialogVisiblelogin" width="30%" :before-close="handleClose">
            <div><span>用户名 </span><el-input placeholder="请输入用户名" style="width: 200px" v-model="user.username"
                clearable></el-input></div>
            <div><span>密码 </span><el-input type="password" placeholder="请输入密码" style="width: 200px"
                v-model="user.password" clearable></el-input></div>
            <span slot="footer" class="dialog-footer">
              <el-button @click="dialogVisiblelogin = false">取 消</el-button>
              <el-button type="primary" @click="userLogin">登 录</el-button>
            </span>
          </el-dialog>
          <el-button type="warning" plain @click="dialogVisibleregister = true">注册</el-button>
          <el-dialog title="提示" :visible.sync="dialogVisibleregister" width="30%" :before-close="handleClose">
            <div><span>用户名 </span><el-input placeholder="请输入用户名" style="width: 200px" v-model="user.username"
                clearable></el-input></div>
            <div><span>密码 </span><el-input placeholder="请输入密码" style="width: 200px" v-model="user.password"
                clearable></el-input></div>
            <span slot="footer" class="dialog-footer">
              <el-button @click="dialogVisibleregister = false">取 消</el-button>
              <el-button type="primary" @click="userRegister">注 册</el-button>
            </span>
          </el-dialog>

          <el-button type="warning" plain @click="logout">注销</el-button>
          <el-button type="primary" plain @click="getStudent">获取学生信息</el-button>
          <el-button type="success" plain @click="dialogVisible = true">添加学生信息</el-button>
          <el-dialog title="提示" :visible.sync="dialogVisible" width="30%" :before-close="handleClose">
            <div><span>添加学生信息</span></div>
            <span slot="footer" class="dialog-footer">
              <el-button @click="dialogVisible = false">取 消</el-button>
              <el-button type="primary" @click="addStudent">添加学生</el-button>
            </span>
            <div><span>学号 </span><el-input placeholder="请输入学号" style="width: 200px" v-model="newStudent.number" clearable>
              </el-input></div>
            <div><span>姓名 </span><el-input placeholder="请输入姓名" style="width: 200px" v-model="newStudent.name" clearable>
              </el-input></div>
            <div><span>性别 </span><el-input placeholder="请输入性别" style="width: 200px" v-model="newStudent.sex" clearable>
              </el-input></div>
            <div><span>年龄 </span><el-input placeholder="请输入年龄" style="width: 200px" v-model.number="newStudent.age"
                clearable> </el-input></div>
            <div><span>学院 </span><el-input placeholder="请输入学院" style="width: 200px" v-model="newStudent.department"
                clearable> </el-input></div>
            <div><span>班级 </span><el-input placeholder="请输入班级" style="width: 200px" v-model="newStudent.classes"
                clearable> </el-input></div>
          </el-dialog>
          <div style="margin-top: 15px;">
            <el-input placeholder="请输入要搜索的字段" v-model="inputSearch" @keyup.enter.native="search"
              class="input-with-select">
              <el-select v-model="SearchSelect" slot="prepend" placeholder="请选择">
                <el-option label="学号" value="number"></el-option>
                <el-option label="姓名" value="name"></el-option>
                <el-option label="性别" value="sex"></el-option>
                <el-option label="年龄" value="age"></el-option>
                <el-option label="学院" value="department"></el-option>
                <el-option label="班级" value="classes"></el-option>
              </el-select>
              <el-button slot="append" icon="el-icon-search" @click="search"></el-button>
            </el-input>
          </div>
        </caption>
        <thead>
          <tr>
            <!-- <th scope="col">#</th> -->
            <th scope="col">学号</th>
            <th scope="col">姓名</th>
            <th scope="col">性别</th>
            <th scope="col">年龄</th>
            <th scope="col">学院</th>
            <th scope="col">班级</th>
            <th scope="col">操作</th>
            <th scope="col"></th>
          </tr>
        </thead>

        <tbody class="table-group-divider">
          <Student v-for="stu in studentForPage" :key="stu.id" :student="stu"></Student>
        </tbody>
      </table>
    </div>
    <div class="text-center">
      <el-button-group>
        <el-button type="primary" icon="el-icon-arrow-left" @click="prePage">上一页</el-button>
        <el-button type="primary" @click="nextPage">下一页<i class="el-icon-arrow-right el-icon--right"></i></el-button>
      </el-button-group>
    </div>

  </div>
</template>

<script>
import axios from "axios"
import Student from './components/Student'
export default {
  name: "App",
  components: {
    Student,
  },
  data() {
    return {
      page: 1,
      onePageStudents: 10,//1页显示几个学生
      students: [],
      dialogVisible: false,
      dialogVisiblelogin: false,
      dialogVisibleregister: false,
      newStudent: {
        number: "",
        name: "",
        sex: "",
        age: "",
        department: "",
        classes: ""
      },
      user: {
        username: "",
        password: ""
      },
      SearchSelect: "",
      inputSearch: ""
    }
  },
  methods: {
    getStudent() {
      if (sessionStorage.getItem("isLogined") != "true") {
        alert("您还未登录")
        return;
      }
      axios({
        url: "http://localhost:8080/students",
        method: "GET",
      }).then((res) => {
        console.log(res.data);
        this.students = res.data;
      })
    },
    handleClose(done) {
      this.$confirm('确认关闭？')
        .then(_ => {
          done();
        })
        .catch(_ => { });
    },
    addStudent() {
      if (sessionStorage.getItem("isLogined") != "true") {
        alert("您还未登录")
        return;
      }
      axios({
        url: "http://localhost:8080/add",
        method: "POST",
        data: this.newStudent
      })
      this.dialogVisible = false
    },
    nextPage() {
      if (this.page * this.onePageStudents < this.students.length) {//下一页的第一个元素存在
        this.page += 1;
      }
    },
    prePage() {
      if (this.page > 1) {
        this.page -= 1;
      }
    },
    userLogin() {
      axios({
        url: "http://localhost:8080/login",
        method: "POST",
        data: this.user
      }).then((res) => {
        console.log(res)
        if (res.data == "登录成功") {
          sessionStorage.setItem("isLogined", "true");
          alert("登录成功");
        }
        else {
          alert("用户名或密码错误");
        }
      });
      this.dialogVisiblelogin = false
    },
    userRegister() {
      axios({
        url: "http://localhost:8080/register",
        method: "POST",
        data: this.user
      }).then((res) => {
        console.log(res)
        if (res.data == "注册成功") {
          alert("注册成功");
        }
        else {
          alert("注册失败");
        }
      }).catch((error) => {
        console.log(error);
        alert("注册失败，发生错误：" + error.message); // 弹出错误提示框
      });
      this.dialogVisibleregister = false
    },
    logout() {
      sessionStorage.removeItem("isLogined")
      alert("注销成功");
      location.reload();
    },
    search() {
      axios({
        url: "http://localhost:8080/search",
        method: "POST",
        data: {
          data: this.inputSearch,
          control: this.SearchSelect
        }
      }).then(res => {
        this.students = res.data;
      })
      this.page = 1;
    }
  },
  computed: {
    studentForPage() {
      return this.students.slice(this.page * this.onePageStudents - this.onePageStudents, this.page * this.onePageStudents);
    }
  }
};
</script>

<style>
.el-select .el-input {
  width: 130px;
}

.input-with-select .el-input-group__prepend {
  background-color: #fff;
}
</style>
