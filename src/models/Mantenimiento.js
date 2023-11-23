import  Sequelize  from "sequelize";
import  {sequalize, sequelize}  from "../database/database";

const Mantenimiento = sequalize.define('Mantenimiento', {
  fecha: {
    type: Sequelize.DATE,
    allowNull: false,
  },
  alquiler: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  tipomantenimiento: {
    type: Sequelize.STRING,
    allowNull: true,
  },
  planta: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  usuario: {
    type: Sequelize.STRING,
    allowNull: false,
  },
},{
    timestamps: false,
    freezeTableName: true,
    tableName: 'mantenimientos', // Asegúrate de que coincida con el nombre de tu tabla en la base de datos
  });

module.exports = Mantenimiento;