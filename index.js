const express = require('express')
const app = express()
app.use(express.json())
app.use(express.static('testCloudRun/dist/cloudrun'))
const port = process.env.PORT || 8080
app.listen(port)
