// Notas: Al explotar las "burbujas no es 100% preciso //<>// //<>// //<>//

import java.util.Random;
import gifAnimation.*;

void setup() {
  fullScreen();

  fondo = new Gif (this, "data/beyond the other side.gif");
  fondo.loop();

  matriz = generarBurbujas(matriz);
  int intentos = 0;
  while (!matrizEsValida(matriz, minBurbujas, maxBurbujas, porcentajeCeldasMinimas, porcentajeCeldasMaximas)) {
    matriz = generarBurbujas(matriz);
    intentos++;
    println(intentos);
    if (intentos > intentosMaximos) {
      println("Demasiados intentos");
      break;
    }
  }
}

void draw() {
  background(255);

  switch (escenaActual) {
  case MENU:
    fill(0);
    textSize(64);
    text("Menu", width / 2, height / 2);
    break;
  case RECURSIVO:
    image(fondo, 0, 0, width, height);
    crearTablero(filas, columnas, lado);
    mostrarBurbujas(matriz, lado);
    break;
  case ITERATIVO:
    fill(0);
    textSize(64);
    text("Iterativo", width / 2, height / 2);
    break;
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    escenaActual = Escena.RECURSIVO;
  } else if (keyCode == RIGHT) {
    escenaActual = Escena.ITERATIVO;
  } else if (keyCode == DOWN) {
    escenaActual = Escena.MENU;
  }
}

void mousePressed() {
  for (int i = 0; i < contadorBurbujas; i++) {
    PVector posicion = posicionesBurbujas[i];
    PVector indices = indicesBurbujas[i];

    lado = obtenerTamañoCelda(filas, columnas, lado, maximoAncho, maximoAlto);
    float radio = lado / 2;

    if (dist(mouseX, mouseY, posicion.x + lado / 2 - radio / 2, posicion.y - (textAscent() + textDescent()) / 2) < radio) {
      int indiceI = (int) indices.x;
      int indiceJ = (int) indices.y;

      explotarBurbujas(matriz, indiceI, indiceJ);
    }
  }
}
