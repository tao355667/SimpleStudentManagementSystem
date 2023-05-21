const axios=require('axios')

axios({
    url:'http://localhost:8080/students',
    methods: 'GET',

}).then(res =>{
    console.log(res.data);
})