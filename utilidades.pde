/**
 * Imprime en consola la matriz
 *
 * @param matrix La matriz a imprimir
 */
void mostrarMatrix(int[][] matrix) {
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[0].length; j++) {
      System.out.print(matrix[i][j] + " ");
    }
    System.out.println();
  }
}

/**
 * Imprime en consola la matriz
 *
 * @param matrix La matriz a imprimir
 */
void mostrarMatrix(boolean[][] matrix) {
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[0].length; j++) {
      System.out.print(matrix[i][j] + " ");
    }
    System.out.println();
  }
}

/**
 * Realiza una copia de una matriz.
 *
 * Crea una nueva matriz de enteros con los elementos de la matriz original y con el mismo tamaño.
 *
 * @param matrix La matriz de enteros que se desea copiar. Se asume que no es nula
 *               y tiene al menos una fila y una columna.
 * @return Una nueva matriz que es una copia de la matriz original.
 */
int[][] copiarMatriz(int[][] matriz) {
  int[][] copia = new int[matriz.length][matriz[0].length];
  for (int i = 0; i < matriz.length; i++) {
    for (int j = 0; j < matriz[0].length; j++) {
      copia[i][j] = matriz[i][j];
    }
  }
  return copia;
}

/**
* Convierte una matriz de enteros a una matriz de booleanos.
*
* Cada elemento en la matriz de enteros se evalúa y se convierte a 'true' si es igual a 1, 
* y a 'false' si es diferente de 1.
*
* @param matriz La matriz de enteros que se desea convertir.
* @return Una matriz de booleanos resultante de la conversión, donde cada elemento es 'true' 
*         si el valor correspondiente en la matriz de enteros es 1, y 'false' en caso contrario.
*/
boolean[][] convertirMatrizABoolean(int[][] matriz) {
  boolean[][] matrizBoolean = new boolean[matriz.length][matriz[0].length];
  
  for (int i = 0; i < matriz.length; i++) {
    for (int j = 0; j < matriz[0].length; j++) {      
      matrizBoolean[i][j] = (matriz[i][j] == 1) ? true : false;
    }
  }
  return matrizBoolean;
}

/**
* Genera un 1 o un 0 basado en una probabilidad específica que está entre dos valores dados.
*
* @param probabilidadMinima La probabilidad mínima de generar un 1 (valor entre 0.0 y 1.0).
* @param probabilidadMaxima La probabilidad máxima de generar un 1 (valor entre 0.0 y 1.0).
* @return 1 con la probabilidad dada, de lo contrario 0.
*/
int generarValor(float probabilidadMinima, float probabilidadMaxima) {
  Random random = new Random();
  float probabilidad = probabilidadMinima + random.nextFloat() * (probabilidadMaxima - probabilidadMinima);
  return (random.nextFloat() <= probabilidad) ? 1 : 0;
}

/**
* Verifica si una matriz cumple con las condiciones de validez en términos de 
* la cantidad de burbujas y celdas ocupadas.
* 
* Esta función evalúa si la cantidad de burbujas presentes en la matriz está 
* dentro de los límites especificados (mínimo y máximo), así como también si 
* el total de celdas ocupadas por burbujas está dentro del rango definido por 
* las probabilidades mínima y máxima.
* 
* @param matriz           La matriz bidimensional de enteros que se va a evaluar.
* @param burbujasMinimas  El número mínimo de burbujas que debe haber en la matriz.
* @param burbujasMaximas  El número máximo de burbujas que puede haber en la matriz.
* @param probabilidadMinima La proporción mínima de celdas ocupadas por burbujas 
*                           (valor entre 0.0 y 1.0).
* @param probabilidadMaxima La proporción máxima de celdas ocupadas por burbujas 
*                           (valor entre 0.0 y 1.0).
* 
* @return true si la matriz es válida (cumple con los criterios de burbujas y 
*         celdas ocupadas), false en caso contrario.
*/
boolean matrizEsValida(int[][] matriz, int burbujasMinimas, int burbujasMaximas, float probabilidadMinima, float probabilidadMaxima) {
  int celdasMinimas = (int) (matriz.length * matriz[0].length * probabilidadMinima);
  int celdasMaximas = (int) (matriz.length * matriz[0].length * probabilidadMaxima);
  
  if (!(contarCeldasConBurbuja(matriz) >= celdasMinimas && contarCeldasConBurbuja(matriz) <= celdasMaximas)) {
    return false;
  }
  
  if (!(contarBurbujas(matriz) >= burbujasMinimas && contarBurbujas(matriz) <= burbujasMaximas)) {
    return false;
  }
  
  return true;
}
