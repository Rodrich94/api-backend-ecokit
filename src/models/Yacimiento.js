import  Sequelize  from "sequelize";
import  {sequalize, sequelize}  from "../database/database";

import Planta from "./Planta";
import Empresa from "./Empresa";
import Ubicacion from "./Ubicacion";

const Yacimiento = sequalize.define('yacimiento',{
    nombre_id : {
        type: Sequelize.TEXT,
        primaryKey: true,
    },
    cant_operadores:{
        type: Sequelize.INTEGER,
    },
    cant_banios_quimicos:{
        type: Sequelize.INTEGER,
    },
    telefono_contacto:{
        type: Sequelize.TEXT,
    },
    empresa_id : {
        type: Sequelize.TEXT,
        foreignKey: true,
    },

    
},{
    timestamps: false,
    freezeTableName: true,
    tableName: 'yacimiento'
});





export default Yacimiento;