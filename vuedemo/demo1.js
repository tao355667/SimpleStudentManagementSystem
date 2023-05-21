/*js练习 */
var id=3;
var a = {
    id,
    showId(name) {
        console.log(name);
    },
    friends: ["小黄", "小明"],
    b:res=> {
        console.log(this.id);
    }
};

// console.log(a.id)
// a.showId("李四");
// console.log(a.friends[0]);
a.b("qwer");