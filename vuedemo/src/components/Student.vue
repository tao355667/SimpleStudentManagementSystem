<template>
    <tr>
        <!-- <th scope="row">{{ student.id }}</th> -->
        <td v-show="!is_edit">{{ student.number }}</td>
        <td v-show="!is_edit">{{ student.name }}</td>
        <td v-show="!is_edit">{{ student.sex }}</td>
        <td v-show="!is_edit">{{ student.age }}</td>
        <td v-show="!is_edit">{{ student.department }}</td>
        <td v-show="!is_edit">{{ student.classes }}</td>
        <td v-show="!is_edit">
            <el-button type="primary" plain @click="modify">修改</el-button>
        </td>
        <td v-show="!is_edit">
            <el-button type="danger" plain @click="deleteStudent">删除</el-button>
        </td>
        <td v-show="is_edit"><input class="w-50" type="text" v-model="student.number" /></td>
        <td v-show="is_edit"><input class="w-50" type="text" v-model="student.name" /></td>
        <td v-show="is_edit"><input class="w-50" type="text" v-model="student.sex" /></td>
        <td v-show="is_edit"><input class="w-50" type="text" v-model.number="student.age" /></td>
        <td v-show="is_edit"><input class="w-50" type="text" v-model="student.department" /></td>
        <td v-show="is_edit"><input class="w-50" type="text" v-model="student.classes" /></td>
        <td v-show="is_edit">
            <el-button type="primary" plain @click="save">保存</el-button>
        </td>
        <td v-show="is_edit">
            <el-button type="danger" plain>删除</el-button>
        </td>

    </tr>
</template>
<script>
import axios from 'axios'
export default {
    props: ["student"],
    data() {
        return {
            is_edit: false
        }
    },
    methods: {
        modify() {
            this.is_edit = true;
        },
        save() {
            axios({
                url: "http://localhost:8080/update",
                method: 'POST',
                data: this.student
            })
            this.is_edit = false;
        },
        deleteStudent() {
            axios({
                url: "http://localhost:8080/delete",
                method: "POST",
                data: this.student
            })
            location.reload();
        }
    }
}
</script>

<style></style>