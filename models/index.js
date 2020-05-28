const Sequelize = require('sequelize')
const allConfigs = require('../configs/sequelize')
const manufacturersModel = require('./manufacturers')
const vehicleModelsModel = require('./vehicleModels')
const myCarsModel = require('./myCars')
const myCars2VehiclesModel = require('./myCars2Vehicles')

const environment = process.env.NODE_ENV || 'development'
const config = allConfigs[environment]

const connection = new Sequelize(config.database, config.username, config.password, {
  host: config.host, dialect: config.dialect,
})

const manufacturers = manufacturersModel(connection, Sequelize)
const vehicleModels = vehicleModelsModel(connection, Sequelize)
const myCars = myCarsModel(connection, Sequelize)
const myCars2Vehicles = myCars2VehiclesModel(connection, Sequelize, myCars, vehicleModels)

manufacturers.hasMany(vehicleModels)
vehicleModels.belongsTo(manufacturers)

myCars.belongsToMany(vehicleModels, { through: myCars2Vehicles })
vehicleModels.belongsToMany(myCars, { through: myCars2Vehicles })

module.exports = {
  manufacturers,
  vehicleModels,
  myCars,
  myCars2Vehicles,
  Op: Sequelize.Op
}

