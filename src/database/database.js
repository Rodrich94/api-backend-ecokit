import { Sequelize } from "sequelize";

export const sequalize = new Sequelize(
    'ecokitcyv',
    //usuario
    'postgres',
    //pass
    'fp',
    {
        host:'localhost',
        dialect:'postgres',
        port: 5432, 
        pool:{
            max: 5,
            min: 0,
            require: 30000,
            idle: 10000,
        },
        loggin: false 
});

