# Generative Art Filters Application

A Java desktop app built with Processing that allows you to apply artistic filters to an uploaded image or to a web cam capture.

The application is organised into one primary sketch and three classes, each representing a modern art style and containing the necessary code to implement thefilter methods called in the main sketch. Two external libraries were used, the first (the user-contributed library ControlP5 by Andreas Schlegel) to aid with the construction of the user interface, and the second (the external Video library based on the GStreamer multimedia framework) to permit the user to capture an from a webcam or a camera connected to the computer.

### The Impressionism Filter
With the Impressionism class, I used the Pshape class to define a 'brush' and, using an appropriate opacity and some randomly-varied vertices, managed to generate a free brush-stroke-like effect which I felt captured something of the Impressionist style. Two methods are available: one that applies the effect to the entire canvas automatically, and a second which allows the user to apply the effect manually.
The defining points of Impressionistic paintings which I aimed to emulate with my filter were as follows:
- A free, loose brush-stroke effect.
- An emphasis on thickly applied colour at the expense of clearly defined outlines.
- An appearance or sense of the shifting of the atmosphere (or the passing of time), rather
than frozen, finely-focused detail.
- An 'unfinished' or 'raw' appearance.
