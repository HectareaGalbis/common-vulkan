
#!/bin/bash

if [ -f $1/$1.vert ]
then /usr/bin/glslc $1/$1.vert -o ./$1/vert.spv
fi

if [ -f $1/$1.frag ]
then /usr/bin/glslc $1/$1.frag -o ./$1/frag.spv
fi

if [ -f $1/$1.geom ]
then /usr/bin/glslc $1/$1.geom -o ./$1/geom.spv
fi
