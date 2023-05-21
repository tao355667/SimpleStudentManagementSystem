const axios = require('axios')

axios({
    url: 'http://localhost:8080/add',
    methods: 'Post',
    data: {
        // id:4,
        number: '艾德',
        name: '小789',
        sex: '男',
        age: 14,
        department: '789',
        classes: '计科1班',
    }
})
