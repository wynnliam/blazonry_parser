// Liam Wynn, 2/14/2018, Blazonry Parser

/*
	In this program, I set out to write a parser for
	simple blazons that roughly follow the rules of the
	SCA College of Arms. The code used here will at some
	point be apart of Ulysses, wherein I attempt to model
	humanoid populations.

	The most fundamental part of this program is the grammar,
	which is presented here:

	Blazon -> Field | Field Ordinary
	Field -> Tincture | Division
	Division -> "per" Div_Type Line Tincture "and" Tincture
	Line -> e | Line_Type
	Ordinary -> Ordinary_Type Tincture

	Essentially, a blazon (a herald/device) is described as
	a field, or a field with an ordinary on it. Firstly, we'll
	describe a field. A field is either a single tincture, which
	is basically a color/simple pattern, or a split of two tinctures.
	That is, a field could be something like an evenly split red and
	blue colored background. A division can specify a line type, so the
	border of the blazon might be wavy or something. Finally, an ordinary
	is a very simple symbol like a cross, or a verticle bar or something.

	TODO: Finish me!
*/

package blazonry;

public class Blazonry
{
	public static void main(String[] args)
	{
		System.out.println("Glad yule!");
	}
}
