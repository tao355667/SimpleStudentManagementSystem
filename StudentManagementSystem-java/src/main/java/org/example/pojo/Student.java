package org.example.pojo;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class Student {
    @JsonProperty(value = "id")
    private long id;//唯一身份标识符
    @JsonProperty(value = "number")
    private String number;//学号
    @JsonProperty(value = "name")
    private String name;//姓名
    @JsonProperty(value = "sex")
    private String sex;//性别
    @JsonProperty(value = "age")
    private int age;//年龄
    @JsonProperty(value = "department")
    private String department;//院系
    @JsonProperty(value = "classes")
    private String classes;//班级
}
