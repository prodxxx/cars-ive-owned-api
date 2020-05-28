const express = require('express')
const bodyParser = require('body-parser')
const { getAllManufacturers, getManufacturersByIdentifier } = require('./controllers/manufacturers')
const { getAllVehicleModels, getVehicleModelsByIdentifier } = require('./controllers/vehicleModels')
const { getAllMyCars, getMyCarsToRepurchase, getAllMyCarsByYear, saveMyNewCar } = require('./controllers/myCars')

const app = express()

app.set('view engine', 'pug')

app.use(express.static('public'))

app.get('/', (request, response) => {
  return response.render('index')
})

app.get('/manufacturers', getAllManufacturers)
app.get('/manufacturers/:identifier', getManufacturersByIdentifier)

app.get('/vehicleModels', getAllVehicleModels)
app.get('/vehicleModels/:identifier', getVehicleModelsByIdentifier)

app.get('/MyCars', getAllMyCars)
app.get('/MyCars/repurchase/:identifier', getMyCarsToRepurchase)
app.get('/MyCars/year/:identifier', getAllMyCarsByYear)
app.post('/MyCars', bodyParser.json(), saveMyNewCar)

app.all('*', (request, response) => {
  return response.status(404).send('404 Page Not Found!')
})

app.listen(1337, () => {
  console.log('listening on port 1337...') // eslint-disable-line no-console
})
