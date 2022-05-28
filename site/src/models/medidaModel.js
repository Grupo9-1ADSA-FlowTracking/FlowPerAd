var database = require("../database/config");

function buscarUltimasMedidas(idArduino) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select chave as registro, momento as momento_grafico
        from Registro
        where fkArduino = ${idArduino}
        order by idRegistro desc;`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select chave as registro, momento, DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
        from Registro
        where fkArduino = ${idArduino}
        order by idRegistro desc limit 20;`;
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
        instrucaoSql = `COLOCAR O SELECT PUXANDO OS DADOS AGREGADOS - SELECT COUNT + GROUP BY MOMENTO_GRAFICO - PESQUISA COMO CONVERTER EM HORA - TESTAR: SELECT DATEPART(HOUR, GETDATE());`;
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
        instrucaoSql = `select top 1
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,  
                        CONVERT(varchar, momento, 108) as momento_grafico, 
                        fk_aquario 
                        from medida where fk_aquario = ${idArduino} 
                    order by id desc`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select chave as registro, momento, DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
        from Registro
        where fkArduino = ${idArduino}
        order by idRegistro desc limit 10`;
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
