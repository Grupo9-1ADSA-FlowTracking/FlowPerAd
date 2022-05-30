var database = require("../database/config");

function buscarUltimasMedidas(idArduino) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top 15 chave as registro, CONVERT(VARCHAR(30), momento, 108) as momento_grafico
        from Registro
        where fkArduino = ${idArduino}
        order by idRegistro desc;`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select chave as registro, momento, DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
        from Registro
        where fkArduino = ${idArduino}
        order by idRegistro desc limit 15;`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarUltimasMedidasBarra(idArduino) {
    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `SELECT DATENAME(month, momento) as 'momento_grafico', sum(chave) as 'chave' from [dbo].[Registro] 
        where fkArduino = ${idArduino}
        group by DATENAME(month, momento), MONTH(momento) order by month(momento) desc;
        `;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `SELECT MONTHNAME(momento) as momento_grafico, sum(chave) as chave
        FROM Registro where fkArduino = ${idArduino}
        GROUP BY month(momento) order by month(momento) desc;`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idArduino) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top 1 chave as registro, CONVERT(VARCHAR(30), momento, 108) as momento_grafico
        from [dbo].[Registro] where fkArduino = ${idArduino}
        order by idRegistro desc;`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select chave as registro, momento, DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
        from Registro
        where fkArduino = ${idArduino}
        order by idRegistro desc limit 1`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarUltimasMedidasBarra,
    buscarMedidasEmTempoReal
}
