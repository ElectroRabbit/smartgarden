// Configurar la conexión MQTT
var brokerUrl = "ws://192.168.31.2:8083/mqtt";
var client = new Paho.MQTT.Client(brokerUrl, "webClient-" + new Date().getTime());
// Establecer el callback para cuando se reciban mensajes
client.onMessageArrived = function (message) {
    var temp = document.getElementById("temperatura");
    var humA = document.getElementById("humedadAmb");
    var humS = document.getElementById("humedadSuelo");
    var nvlA = document.getElementById("nivelAgua");
    var msgA = document.getElementById("msgAgua");
    var msgT = document.getElementById("msgTemp");
    var msgHuA = document.getElementById("msgHuA");
    var msgHuT = document.getElementById("msgHuT");
    var lastUpT = document.getElementById("lastUpT");
    var lastUpHA = document.getElementById("lastUpHA");
    var lastUpHS = document.getElementById("lastUpHS");
    var lastUpA = document.getElementById("lastUpA");

    switch (message.destinationName) {
        case "/devices/IPST_001/temp":
            temp.innerHTML = message.payloadString + "°C";
            lastUpT.innerHTML = "Última actualización: hace unos segundos";
            
            if (message.payloadString <= 16) {
                msgT.innerHTML = "Está muy frío para tu planta.";
            } else if (message.payloadString > 16 && message.payloadString <= 30) {
                msgT.innerHTML = "Temperatura ideal.";
            } else if (message.payloadString > 30) {
                msgT.innerHTML = "Hace mucho calor para tu planta.";
            }
            break;
        case "/devices/IPST_001/humAm":
            humA.innerHTML = message.payloadString + "%";
            lastUpHA.innerHTML = "Última actualización: hace unos segundos";
            
            if (message.payloadString <= 30) {
                msgHuA.innerHTML = "El ambiente un muy seco.";
            } else if(message.payloadString >= 30 && message.payloadString <= 55) {
                msgHuA.innerHTML = "El ambiente un poco seco.";
            } else {
                msgHuA.innerHTML = "El ambiente está bien.";
            }
            break;
        case "/devices/IPST_001/humSu":
            lastUpHS.innerHTML = "Última actualización: hace unos segundos";
            
            if (message.payloadString <= 30) {
                humS.innerHTML = "Seco";
                msgHuT.innerHTML = "La tierra está seca.";
            } else {
                humS.innerHTML = "OK";
                msgHuT.innerHTML = "La tierra está bien.";
            }
            break;
        case "/devices/IPST_001/nvlAgua":
            lastUpA.innerHTML = "Última actualización: hace unos segundos";
            
            if (message.payloadString <= 1) {
                nvlA.innerHTML = "0%";
                msgA.innerHTML = "Rellena el depósito de agua.";
            } else {
                nvlA.innerHTML = message.payloadString + "%";
                msgA.innerHTML = "El depósito de agua tiene reserva.";
            }
            break;
        case "/devices/IPST_001/nvlLuz":
            //Aún no programado...
            break;
    }

    //console.log(message.destinationName);
};
// Conectar al broker MQTT
client.connect({
    onSuccess: function () {
        // Suscribirse a un tema MQTT
        client.subscribe("/devices/IPST_001/#");
    },
    onFailure: function (message) {
        console.log("Error de conexión: " + message.errorMessage);
    }
});