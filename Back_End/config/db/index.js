const mssql = require('mssql/msnodesqlv8');
const dotenv = require('dotenv');

dotenv.config();

const MSSQLpool = new mssql.ConnectionPool({
    server: process.env.MSSQL_SERVER_NAME,
    database: process.env.MSSQL_DATABASE_NAME,
    driver: 'msnodesqlv8',
    options: {
        trustedConnection: true,
    },
});

MSSQLpool.connect()
    .then(() => {
    console.log('Connected to mssql database');
})
.catch((err) => {
    console.log(process.env.MSSQL_SERVER_NAME)
    console.log('MSSQL Database Connection Failed! Bad Config: ', err);
});

module.exports = { MSSQLpool };
 