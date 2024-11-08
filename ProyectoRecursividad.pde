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
    if (intentos > 10) {
      println("Demasiados intentos");
      break;
    }
  }

  matrizBoolean = convertirMatrizABoolean(matriz);

  mostrarMatrix(matrizBoolean);
}

void draw() {
  background(255);

  switch (escenaActual) {
  case MENU:
    print("Menu");
    break;
  case RECURSIVO:
    print("Recursivo");
    image(fondo, 0, 0, width, height);

    crearTablero(filas, columnas, lado);
    mostrarBurbujas(matrizBoolean, lado);
    break;
  case ITERATIVO:
    print("Iterativo");
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
