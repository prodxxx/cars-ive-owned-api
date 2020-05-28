const sinon = require('sinon')
const sinonChai = require('sinon-chai')
const chai = require('chai')
const models = require('../../models')
const {
  after, afterEach, beforeEach, describe, it,
} = require('mocha')
const { manufacturerList, singleManufacturer } = require('../mocks/cars')
const { getAllManufacturers, getManufacturersByIdentifier } = require('../../controllers/manufacturers')



chai.use(sinonChai)
const { expect } = chai

describe('Controllers - API', () => {
  let response
  let sandbox
  let stubbedManufacturersFindAll
  let stubbedManufacturersFindOne
  let stubbedStatusSend


  beforeEach(() => {
    sandbox = sinon.createSandbox()

    stubbedStatusSend = sandbox.stub()

    response = {
      send: sandbox.stub(),
      status: sandbox.stub().returns({ send: stubbedStatusSend }),
      sendStatus: sandbox.stub(),
    }

    stubbedManufacturersFindAll = sandbox.stub(models.manufacturers, 'findAll')
    stubbedManufacturersFindOne = sandbox.stub(models.manufacturers, 'findOne')
  })

  after(() => {
    sandbox.reset()
  })

  afterEach(() => {
    sandbox.restore()
  })

  describe('Manufacturers', () => {
    describe('getAllManufacturers', () => {
      it('returns a list of Manufacturers cleaned for the API', async () => {
        stubbedManufacturersFindAll.returns(manufacturerList)

        await getAllManufacturers({}, response)
        expect(response.send).to.have.been.calledWith(manufacturerList)
      })

      it('returns a 500 error when the database calls fails', async () => {
        stubbedManufacturersFindAll.throws('ERROR!')

        await getAllManufacturers({}, response)
        expect(response.status).to.have.been.calledWith(500)
        expect(stubbedStatusSend).to.have.been.calledWith('Unable to retrieve manufacturers, please try again')
      })
    })

    describe('getManufacturersByIdentifier', () => {
      it.only('returns the manufacturer associated with the identifier passed in', async () => {
        stubbedManufacturersFindOne.returns(singleManufacturer)

        const request = { params: { identifier: 'bmw' } }

        await getManufacturersByIdentifier(request, response)

        expect(stubbedManufacturersFindOne).to.have.been.calledWith({
          attributes: ['id', 'name', 'createdAt', 'updatedAt'],
          where: {
            [models.Op.or]: [
              { id: request },
              { name: { [models.Op.like]: `%${request}%` } }
            ],
          },
          include: [{
            model: models.vehicleModels,
            attributes: ['id', 'name', 'createdAt', 'updatedAt']
          }]
        })
        expect(response.send).to.have.been.calledWith(singleManufacturer)
      })

      it('returns a 404 when no animal can be found for the id passed in', async () => {
        stubbedManufacturersFindOne.returns(null)

        const request = { params: { id: 1 } }

        await getManufacturersByIdentifier(request, response)

        expect(stubbedManufacturersFindOne).to.have.been.calledWith({
          where: { id: 1 },
          include: [{ model: models.VehicleModels }],
        })
        expect(response.sendStatus).to.have.been.calledWith(404)
      })

      it('returns a 500 error when the database calls fails', async () => {
        stubbedManufacturersFindOne.throws('ERROR!')

        const request = { params: { id: 1 } }

        await getManufacturersByIdentifier(request, response)

        expect(stubbedManufacturersFindOne).to.have.been.calledWith({
          where: { id: 1 },
          include: [{ model: models.VehicleModels }],
        })
        expect(response.status).to.have.been.calledWith(500)
        expect(stubbedStatusSend).to.have.been.calledWith('Unknown error while retrieving animal')
      })
    })
  })
})

