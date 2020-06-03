const manufacturers = (connection, Sequelize) => {
  return connection.define('manufacturers', {
    id: { type: Sequelize.INTEGER, primaryKey: true },
    name: { type: Sequelize.STRING, },
  }, { paranoid: true })
}

module.exports = manufacturers
