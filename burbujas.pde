/**
 * Realiza una búsqueda en profundidad (DFS) en una matriz.
 *
 * Esta función explora todas las celdas conectadas que contienen una burbuja (true),
 * comenzando desde la celda (i, j). Durante la exploración, las celdas visitadas son marcadas
 * estableciendo su valor a false.
 *
 * @param matriz La matriz de booleanos donde se realiza la búsqueda.
 * @param i La fila de inicio para la búsqueda.
 * @param j La columna de inicio para la búsqueda.
 */
void explotarBurbujas(boolean[][] matriz, int i, int j) {
  int n = matriz.length;
  int m = matriz[0].length;

  if (i < 0 || i >= n || j < 0 || j >= m) {
    return;
  }

  if (!matriz[i][j]) {
    return;
  }

  matriz[i][j] = false;

  explotarBurbujas(matriz, i - 1, j);
  explotarBurbujas(matriz, i + 1, j);
  explotarBurbujas(matriz, i, j - 1);
  explotarBurbujas(matriz, i, j + 1);
}


boolean[][] generarBurbujas(boolean[][] matriz) {
  for (int i = 0; i < matriz.length; i++) {
    for (int j = 0; j < matriz[0].length; j++) {
      matriz[i][j] = generarValor(0.20, 0.25);
    }
  }

  return matriz;
}

/*if (!matrixEsValida(matrix, 1, 7, 0.2, 0.25)) { // IMPORTANTE
 generarBurbujas(matrix);
 }*/

/**
 * Cuenta el número de "burbujas" en una matriz de enteros.
 *
 * Una burbuja se define como un grupo contiguo de celdas con valor 1.
 * La función utiliza una copia de la matriz original para evitar modificarla durante
 * el proceso de conteo.
 *
 * @param matriz La matriz de enteros en la que se desea contar las burbujas.
 * @return El número de burbujas encontradas en la matriz.
 */
int contarBurbujas(boolean[][] matriz) {
  int burbujas = 0;
  boolean[][] matrizCopiada = copiarMatriz(matriz);

  for (int i = 0; i < matriz.length; i++) {
    for (int j = 0; j < matriz[0].length; j++) {
      if (matriz[i][j]) {
        burbujas++;
        explotarBurbujas(matrizCopiada, i, j);
      }
    }
  }

  return burbujas;
}

/**
 * Cuenta el número de celdas que contienen burbujas en una matriz.
 *
 * Esta función recorre una matriz bidimensional de enteros y cuenta el número
 * de celdas que contienen el valor 1, que representa una burbuja.
 *
 * @param matriz La matriz de enteros la cual se contarán las burbujas.
 *               Se asume que cada celda contiene una burbuja si hay un 1 y si hay cualquier
 *               otro valor no hay una burbuja.
 *
 * @return El número de celdas que contienen burbujas (valor 1) en la matriz.
 */
int contarCeldasConBurbuja(boolean[][] matriz) {
  int celdas = 0;

  for (int i = 0; i < matriz.length; i++) {
    for (int j = 0; j < matriz[0].length; j++) {
      if (matriz[i][j]) {
        celdas++;
      }
    }
  }

  return celdas;
}

/**
 * Muestra burbujas en la pantalla según una matriz booleana.
 *
 * Esta función dibuja una "X" en cada celda del tablero donde el
 * valor correspondiente en la matriz es verdadero. La posición de
 * la "X" se calcula para que esté centrada dentro de cada celda,
 * ajustando las coordenadas basadas en el tamaño de la celda (lado)
 * y el tamaño del texto.
 *
 * @param matriz Una matriz booleana que indica la presencia de
 *               burbujas (true) o su ausencia (false).
 * @param lado   El tamaño (en píxeles) de cada lado de las celdas
 *               del tablero.
 */
void mostrarBurbujas(boolean[][] matriz, int lado) {
  lado = obtenerTamañoCelda(filas, columnas, lado, maximoAncho, maximoAlto);
  fill(0);
  textSize(lado * 0.8f);

  contadorBurbujas = 0;

  for (int i = 0; i < matriz.length; i++) {
    for (int j = 0; j < matriz[0].length; j++) {
      if (matriz[i][j]) {
        int x = (j * lado) + (width / 2) - (columnas * lado / 2);
        int y = (i * lado) + (height / 2) - (filas * lado / 2);     
        x += (lado - textWidth("X")) / 2;
        y += (lado + textAscent() + textDescent()) / 2;
        posicionesBurbujas[contadorBurbujas] = new PVector(x, y);
        indicesBurbujas[contadorBurbujas] = new PVector(i, j);
        contadorBurbujas++;
        text("X", x, y);
      }
    }
  }
}
