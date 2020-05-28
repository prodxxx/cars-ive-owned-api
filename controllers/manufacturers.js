const models = require('../models')

const getAllManufacturers = async (request, response) => {
  try {
    const manufacturers = await models.manufacturers.findAll()

    return manufacturers ? response.send(manufacturers) : response.status(500)
  } catch (error) {
    return response.status(500).send('Unable to retrieve manufacturers, please try again')
  }
}

const getManufacturersByIdentifier = async (request, response) => {
  try {
    const { identifier } = request.params

    const foundManufacturer = await models.manufacturers.findOne({
      attributes: ['id', 'name', 'createdAt', 'updatedAt'],
      where: {
        [models.Op.or]: [
          { id: identifier },
          { name: { [models.Op.like]: `%${identifier}%` } }
        ],
      },
      include: [{
        model: models.vehicleModels,
        attributes: ['id', 'name', 'createdAt', 'updatedAt']
      }]
    })

    return foundManufacturer
      ? response.send(foundManufacturer)
      : response.sendStatus(404)
  } catch (error) {
    return response.status(500).send('Unable to retrieve manufacturer, please try agin')
  }
}

module.exports = { getAllManufacturers, getManufacturersByIdentifier }
