//AUTHOR = ROBERTO VARGAS VARGAS
//VERSION = 1.0

#include <DHT.h>                //Se incluye la librería del sensor DHT11
#include <ESP8266WiFi.h>        //Se incluye la librería del WiFi del ESP8266
#include <Ticker.h>             //Se incluye la librería de Ticker para controlar el Led integrado
#include <Arduino.h>            //Se incluye la librería Arduino
#include <ESP8266WiFi.h>        //Se incluye la librería WiFi del ESP8266
#include <PubSubClient.h>       //Se incluye la librería PubSubClient que nos permite trabajar con MQTT
#include <ESP8266HTTPClient.h>  //Se incluye la librería de HTTP que nos permite trabajar con POST
#include <Wire.h>               //Se incluye la librería de Wire para controlar el LCD
#include <Adafruit_SSD1306.h>   //Se incluye la librería de Adafuit para el LCD
#include "eyes.h"               //Se incluyen los bitmap de los ojos para el LCD

///////////////////////////////////////////////////////

//D1 = SCK DISPLAY
//D2 = SDA DISPLAY

//D3 = SENSOR TEMP Y HUM - DHT11
//D4 = LED WIFI
//D5 = SENSOR LUZ - LDR FOTORESISTOR
//D6 = SENSOR NIVEL DE AGUA
//D7 = SENSOR HUMEDAD DE TIERRA
//D8 = RELAY BOMBA AGUA

//A0 = ENTRADA ANÁLOGA

////////////////////////////////////////////////////////

#define SCREEN_WIDTH 128  // OLED display width, in pixels
#define SCREEN_HEIGHT 64  // OLED display height, in pixels
#define OLED_RESET -1     // Reset pin # (or -1 if sharing Arduino reset pin)
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

DHT dht(D3, DHT11);  //Se inicia el sensor en el puerto digital D3

float temperaturaAmbiente; //Iniciar variable de temperatura del ambiente.
int humedadAmbiente;  //Iniciar variable de humedad del ambiente.
int nivelAgua, nivelAguaPorcentaje;        //Iniciar variables de nivel de agua en bruto y porcentaje.
int nivelLuz;                              //Iniciar variable de sensor de luz (0 - 1);
int humedadSuelo;                          //Iniciar variable de nivel de humedad del suelo.
Ticker tic_WifiLed;                        //Iniciar el objeto ticker con nombre tic_WifiLed;

//Información para conectar el WiFi
String ssidWiFi = "SmartGarden IoT";
String passwordWiFi = "12345678";

//Información asociada al BROKER MQTT
const char* serverMQTT = "192.168.31.2";     //Modificar según la IP o dominio del Broket MQTT
const int portMQTT = 1883;                   //Modificar según el puerto del Broker MQTT
const char* nombreDispositivo = "IPST_001";  //Modificar según el nombre del dispositivo

//Información asociada al servidor Web
String serverWeb = "http://192.168.31.3/SmartGarden/insertData.do";  //Enviamos el controlador que se encargará del proceso de guardado en la BBDD

char serial_command = -1;
unsigned long previousMillis = 0;
unsigned long interval = 30000;

WiFiClient wlanclient;
PubSubClient mqttClient(wlanclient);

char msg[50];

//Variables varias que se utilizan durante el programa
int contador = 0;
int intentosMaximos = 25;
boolean caraActiva = false;

//Declaramos los pines que usaremos
int entradaAnaloga = A0;
int ledWifi = D4;
int sensorLuz = D5;
int sensorNivelAgua = D6;
int sensorHumedadA = D7;
int bombaAgua = D8;

void setup() {
  Serial.begin(9600);  //Inicializar el puerto serie en 9600
  dht.begin();         //Inicializar la librería DHT

  //Indicamos los pines de salida
  pinMode(sensorNivelAgua, OUTPUT);
  pinMode(sensorHumedadA, OUTPUT);
  pinMode(bombaAgua, OUTPUT);
  pinMode(ledWifi, OUTPUT);

  //Indicamos pines de entrada
  pinMode(A0, INPUT);

  //Inicializamos la conexión de WiFi
  boolean wifiAux = conectarWiFi();
  if (wifiAux == false) {
    for (;;)
      ;  // No procede, loop infinito.
  }

  //Inicializamos la conexión MQTT
  boolean mqttAux = conectarBrokerMQTT();
  if (mqttAux == false) {
    for (;;)
      ;  // No procede, loop infinito.
  }

  //Inicializar el display
  if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3c)) {
    Serial.println(F("SSD1306 allocation failed"));
    for (;;)
      ;  // Don't proceed, loop forever
  }

  display.display();
  display.clearDisplay();
  display.display();
}

void loop() {

  if (caraActiva == false) {
    mostrarCaraNormal();
  }

  //Leemos el valor de humedad ambiente
  humedadAmbiente = leerHumedad();

  //Leemos el valor de temperatura ambiente
  temperaturaAmbiente = leerTemperatura();

  //Leemos el nivel del agua
  nivelAgua = leerNivelAgua();
  //Nivel de agua en porcentaje
  nivelAguaPorcentaje = map(nivelAgua, 400, 12, 100, 0);  //Nivel de agua analogo a porcentaje

  //Solucionamos lecturas erroneas
  if (nivelAguaPorcentaje <= 1) {
    nivelAguaPorcentaje = 0;
  }

  //Leemos el nivel del LDR
  nivelLuz = leerNivelLuz();

  //Leemos el nivel de humedad del suelo
  humedadSuelo = leerNivelHumedad();

  if (humedadSuelo <= 1) {
    humedadSuelo = 0;
  }

  //Mostramos toda la información obtenida por puerto serial
  //Serial.println("Temperatura: " + String(temperaturaAmbiente) + "°C");
  //Serial.println("Humedad: " + String(humedadAmbiente) + "%");
  //Serial.println("Nivel de Agua: " + String(nivelAgua));
  //Serial.println("Porcentaje Nivel de Agua: " + String(nivelAguaPorcentaje) + "%");
  //Serial.println("LDR: " + String(nivelLuz));
  //Serial.println("Humedad Suelo: " + String(humedadSuelo));
  //Serial.println("-----------------------------------");

  if (!mqttClient.connected()) {
    conectarBrokerMQTT();
  }

  //Publicamos los datos en el Servidor MQTT
  mqttClient.publish("/devices/IPST_001/temp", String(temperaturaAmbiente).c_str());     //Temperatura
  mqttClient.publish("/devices/IPST_001/humAm", String(humedadAmbiente).c_str());        //Humedad
  mqttClient.publish("/devices/IPST_001/nvlAgua", String(nivelAguaPorcentaje).c_str());  //Nivel de Agua en %
  mqttClient.publish("/devices/IPST_001/nvlLuz", String(nivelLuz).c_str());              //Estado Luz
  mqttClient.publish("/devices/IPST_001/humSu", String(humedadSuelo).c_str());           //Humedad de Suelo

  //Publicmaos los datos en el Servidor Web para su persistencia
  enviarDatosBBDD(temperaturaAmbiente, humedadAmbiente, humedadSuelo, nivelLuz, nivelAguaPorcentaje);

  //Evaluamos el nivel del agua
  if (nivelAguaPorcentaje <= 10) {
    Serial.println("Nivel de agua muy bajo para regar");
    mostrarCaraTriste();
  }

  //Para regar, primero revisamos el nivel
  if (nivelAguaPorcentaje >= 30) {
    if (humedadSuelo >= 700) {
      Serial.println("La tierra está seca, comienza el riego automático");

      display.clearDisplay();

      display.setTextSize(2);
      display.setCursor(0, 0);
      display.print("Regando...");

      display.display();

      activarBomba();
      delay(2000);
      desactivarBomba();
      delay(1000);

      mostrarCaraNormal();

    } else {
      Serial.println("La tierra está humeda, no hace falta regar");
      mostrarCaraNormal();
    }
  }

  delay(60000);  // Espera 60s
}

//Funcion para conectar el WiFi
boolean conectarWiFi() {
  tic_WifiLed.attach(0.2, parpadearLedWifi);  // Parpadeo del LED WiFi cada 0.2 segundos

  WiFi.begin(ssidWiFi, passwordWiFi);
  while (WiFi.status() != WL_CONNECTED and contador < intentosMaximos) {
    contador++;
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  if (contador < intentosMaximos) {  //Si se conecta hace esto
    Serial.println("********************************************");
    Serial.print("Conectado a la red WiFi: ");
    Serial.println(WiFi.SSID());
    Serial.print("IP: ");
    Serial.println(WiFi.localIP());
    Serial.print("macAdress: ");
    Serial.println(WiFi.macAddress());
    Serial.println("*********************************************");
    return true;
  } else {  //No se conectó
    Serial.println("------------------------------------");
    Serial.println("Error al conectar el WiFi");
    Serial.println("------------------------------------");
    return false;
  }

  tic_WifiLed.detach();
  digitalWrite(ledWifi, HIGH);
}

//Funcion para conectar el Broker MQTT
boolean conectarBrokerMQTT() {
  mqttClient.setServer(serverMQTT, portMQTT);
  //mqttClient.setCallback(mqttCallback);

  if (mqttClient.connect(nombreDispositivo, NULL, NULL)) {
    Serial.println("Conectado al Broker MQTT");
    return true;
  } else {
    Serial.println("Error al conectar con el Broker MQTT");
    Serial.println(mqttClient.state());
    delay(200);
    return false;
  }
}

//Función que mediante POST envía los datos a la página web y esta los almacena en la base de datos
void enviarDatosBBDD(int tA, int hA, int hS, int nL, int nA) {
  //Mientras estemos conectados al WiFi se iniciará la función, caso contrario no se activará el envío de datos
  if (WiFi.status() == WL_CONNECTED) {
    HTTPClient http;  // Creamos el objeto HTTP
    String argumentos = "tempA=" + String(tA)
                        + "&humA=" + String(hA)
                        + "&nvlAgua=" + String(nA)
                        + "&nvlLuz=" + String(nL)
                        + "&humSuelo=" + String(hS);  //Concatenamos el string que irá en el POST con las lecturas

    http.begin(wlanclient, serverWeb);                                    //Le enviamos el servidor web
    http.addHeader("Content-Type", "application/x-www-form-urlencoded");  // Definimos el header como texto plano

    int codigo_respuesta = http.POST(argumentos);

    //Si el código es mayor que 200 significa que recibimos respuesta correcta
    if (codigo_respuesta > 0) {
      Serial.println("Código HTTP: " + String(codigo_respuesta));
      if (codigo_respuesta == 200) {
        String cuerpo_respuesta = http.getString();
        Serial.println("Datos enviados correctamente");
      }
      //Si no, algo falló
    } else {
      Serial.print("Error enviado POST, código: ");
      Serial.println(codigo_respuesta);
    }

    http.end();  // Cerramos el objeto HTTP

  } else {
    Serial.println("Error en la conexion WIFI");
  }

  //delay(300000) //espera 5 minutos
}

//Funcion que hace parpadear el LED D4 cuando la conexión está en proceso
void parpadearLedWifi() {
  byte estado = digitalRead(ledWifi);
  digitalWrite(ledWifi, !estado);
}

//Funcion para leer la Temperatura
float leerTemperatura() {
  return dht.readTemperature();
}

//Funcion para leer la humedad
int leerHumedad() {
  return dht.readHumidity();
}

//Funcion para leer el nivel de agua
int leerNivelAgua() {
  digitalWrite(D7, LOW);
  digitalWrite(D6, HIGH);
  delay(500);
  int aux = analogRead(entradaAnaloga);
  ;
  digitalWrite(D6, LOW);
  return aux;
}

//Funcion para leer el nivel de humedad del suelo
float leerNivelHumedad() {
  digitalWrite(D6, LOW);
  digitalWrite(D7, HIGH);
  delay(500);
  int aux = analogRead(A0);
  digitalWrite(D7, LOW);
  return aux;
}

//Funcion para leer el nivel de luz
int leerNivelLuz() {
  return digitalRead(sensorLuz);  // 0 = Hay luz // 1 = No hay luz
}

//Funcion para activar la bomba de agua
void activarBomba() {
  digitalWrite(bombaAgua, HIGH);
  Serial.println("Bomba activada.");
}

//Funcion para desactivar la bomba de agua
void desactivarBomba() {
  digitalWrite(bombaAgua, LOW);
  Serial.println("Bomba desactivada.");
}

//Funcion que cambia la cara del display
void mostrarCaraNormal() {
  display.clearDisplay();

  display.drawBitmap(16, 8, peyes[1][0][0], 32, 32, WHITE);  //IZQUIERDO
  display.drawBitmap(80, 8, peyes[1][0][0], 32, 32, WHITE);  //DERECHO

  display.display();
  caraActiva = true;
}

//Funcion que cambia la cara del display
void mostrarCaraTriste() {
  display.clearDisplay();

  display.drawBitmap(16, 8, peyes[5][0][0], 32, 32, WHITE);  //IZQUIERDO
  display.drawBitmap(80, 8, peyes[3][0][0], 32, 32, WHITE);  //DERECHO

  display.display();
  caraActiva = true;
}
