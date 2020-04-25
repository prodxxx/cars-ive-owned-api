const express = require('express')

const app = express()

app.set('view engine', 'pug')

app.use(express.static('public'))

app.get('/', (request, response) => {
  return response.render('index')
})


app.all('*', (request, response) => {
  return response.status(404).send('404 Page Not Found')
})

app.listen(1337, () => {
  console.log('listening on port 1337...') // eslint-disable-line no-console
})
