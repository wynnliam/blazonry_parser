# blazonry_parser
A system that can verify formal descriptions of simple blazonry.

In this system, I drastically simplify the kinds of blazons you
can create. It does not specify division of more than two tinctures,
or any fansy charges.

I got the idea for this from [here](http://heraldry.sca.org/armory/bruce.html)

I'd read that then come back here and see what I didn't add.

Still, this is a very cool system... or at least it will be when its done.
For now, I wrote a simple system that can verify if a given blazon description
is valid. I decided to use Haskell for that to practice in a functional paradigm.
The final project will be in Java. Essentially, imagine a GUI where there is
an image, a console, and a text box. You type in the blazon in the text box, if there
are any errors, the console will print them accordingly, and the final blazon gets
rendered to the image.

You can find the grammar in the grammar folder, but I will post it here:

`Ordinary -> Ordinary_Type Tincture`

Line -> e | Line_Type

Division -> "per" Div_Type Line Tincture "and" Tincture

Field -> Tincture | Division

Blazon -> Field | Field Ordinary

There are files lisitng all the line types, tincture types, and more.

