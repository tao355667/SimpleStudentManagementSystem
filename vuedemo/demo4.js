const axios = require('axios')

axios({
    url: 'http://localhost:8080/update',
    methods: 'Post',
    data: {
        id:10,
        number: 'update10',
        name: '小789',
        sex: '男',
        age: 66,
        department: '789',
        classes: '计科1班',
    }
})
