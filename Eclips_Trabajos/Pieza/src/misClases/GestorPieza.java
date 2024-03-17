package misClases;

import java.util.ArrayList;

public class GestorPieza {
	ArrayList<Pieza> lista;

//	Constructor
	GestorPieza() {
		lista = new ArrayList<Pieza>();
	}

//------------------------------------------------------------------------------------------------	
	void añadirPieza() {
//		Pedimos los datos de la pieza 
		System.out.println(" Introduce el código: ");
		int codigo = App.teclado.nextInt();
		App.teclado.nextLine();
//		Buscamos si ya existe una pieza con ese codigo 
		if (buscarPieza(codigo) == -1) {
//			No esta. Pedimos el resto de datos
			System.out.println(" Introduce el nombre: ");
			String nombre = App.teclado.nextLine();

			System.out.println(" Introduce el descripcióm: ");
			String descipcion = App.teclado.nextLine();

			System.out.println(" Introduce el largo: ");
			float largo = App.teclado.nextFloat();

			System.out.println(" Introduce el ancho: ");
			float ancho = App.teclado.nextFloat();

			System.out.println(" Introduce el peso: ");
			float peso = App.teclado.nextFloat();

//			Creamos el obejto pieza con esos datos
			Pieza nuevaPieza = new Pieza(codigo, nombre, descipcion, largo, ancho, peso);
			lista.add(nuevaPieza);

			System.out.println(" Pieza añadida ");
		} else
			System.out.println(" Ya existe una pieza con ese código ");
	}
//---------------------------------------------------------------------------------------------------------

	void econtrarPieza() {
//		Pedimos los datos de la pieza 
		System.out.println(" Introduce el código: ");
		int codigo = App.teclado.nextInt();
		App.teclado.nextLine();
//		Buscamos si ya existe una pieza con ese codigo 
		int posicion;
		if ((posicion = buscarPieza(codigo)) != -1) {
			lista.get(posicion);
		} else
			System.out.println(" No existe niguna pieza con ese código ");
	}
//------------------------------------------------------------------------------------------------------

	void borrarPieza() {
//		Pedimos los datos de la pieza 
		System.out.println(" Introduce el código: ");
		int codigo = App.teclado.nextInt();
		App.teclado.nextLine();
//		Buscamos si ya existe una pieza con ese codigo 
		int posicion;
		if ((posicion = buscarPieza(codigo)) != -1) {
			lista.remove(posicion);
			System.out.println(" Objeto borrado");
		} else
			System.out.println(" No existe niguna pieza con ese código ");
	}
//--------------------------------------------------------------------------------------------------------	
//	Hacemos un metodo para buscar una pieza por su codigo

	int buscarPieza(int codigo) {
//		Retorna -1 si no esta y si no, la posicion en la que esta
		for (int i = 0; i < lista.size(); i++) {
			if (lista.get(i).getCodPieza() == codigo)
				return i;
		}
		return -1;
	}
//------------------------------------------------------------------------------------------------------
}