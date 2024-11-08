/**
* Verifica si el tamaño del tablero es demasiado grande. Si es así, ajusta el tamaño de la celda 
* para que el tablero no exceda el porcentaje del ancho y alto de la pantalla. Si no es necesario ajustar,
* devuelve el tamaño original de la celda.
*
* @param filas   El número de filas que tendrá el tablero.
* @param columnas El número de columnas que tendrá el tablero.
* @param lado    La longitud del lado de cada celda.
* @param maximoAncho El maximo ancho respecto a la ventana. Un valor en porcentaje decimal entre 0.0 y 1.0
* @param maximoAlto El maximo alto respecto a la ventana. Un valor en porcentaje decimal entre 0.0 y 1.0
*
* @return La longitud del lado de la celda, ajustada si es necesario, o el tamaño original si no se requiere ajuste.
*/
int obtenerTamañoCelda(int filas, int columnas, int lado, float maximoAncho, float maximoAlto) {
  boolean anchoExcedido = (columnas * lado) > (width * maximoAncho);
  boolean altoExcedido = (filas * lado) > (height * maximoAlto);
  
  if (anchoExcedido || altoExcedido) {
    int a = (int) (width * maximoAncho / columnas);
    int b = (int) (height * maximoAlto / filas);
    return lado = min(a, b);
  }
  return lado;
}

/**
* Crea un tablero visual compuesto por celdas cuadradas en la ventana de Processing.
* Esta función utiliza la función `obtenerTamañoCelda` para determinar el tamaño adecuado
* de cada celda según el número de filas y columnas. Las celdas se dibujan centradas en
* la ventana, distribuidas uniformemente.
*
* @param filas     El número de filas que tendrá el tablero.
* @param columnas  El número de columnas que tendrá el tablero.
* @param lado      La longitud del lado de cada celda en píxeles.
*/
void crearTablero(int filas, int columnas, int lado) {
  lado = obtenerTamañoCelda(filas, columnas, lado, maximoAncho, maximoAlto);
  
  for (int i = 0; i < filas; i++) {
      for (int j = 0; j < columnas; j++) {
        int x = (j * lado) + (width / 2) - (columnas * lado / 2);
        int y = (i * lado) + (height / 2) - (filas * lado / 2);
        stroke(0);
        fill(255);
        rect(x, y, lado, lado);
        
      }
    }
}
