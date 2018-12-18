/**
 * @author Fabien Dagnat <fabien.dagnat@telecom-bretagne.eu>
 */
package scalaJava;

public class A {
	public void giveMeAnInt(int arg) {
		System.out.println("You gave me " + arg);
	}

	@Override
	public String toString() { return "A"; }
}
