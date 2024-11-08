enum Escena {
  MENU, RECURSIVO, ITERATIVO;
}

Gif fondo;

Escena escenaActual = Escena.MENU;

PVector[] posicionesBurbujas = new PVector[100000]; 
PVector[] indicesBurbujas = new PVector[100000];
int contadorBurbujas = 0; 

boolean actualizado = false;

float maximoAncho = 0.75f;
float maximoAlto = 0.75f;
int lado = 50;
int filas = 40;
int columnas = 20;
int minBurbujas = 1;
int maxBurbujas = 100;
float porcentajeCeldasMinimas = 0.01f;
float porcentajeCeldasMaximas = 0.99f;

boolean[][] matriz = new boolean[filas][columnas];
//boolean[][] matrizBoolean;
int intentosMaximos = 5000;
