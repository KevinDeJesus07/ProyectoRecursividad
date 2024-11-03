import java.util.Random;

void setup() {
  fullScreen();
  fondo = loadImage("data/archipielagoSabaody.png");

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
  image(fondo, 0, 0, width, height);

  crearTablero(filas, columnas, lado);
  mostrarBurbujas(matrizBoolean, lado);
}
