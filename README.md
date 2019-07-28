# youtube-dl_docker
Dockerfile to build an image that runs youtube-dl


Contents
--------

Dockerfile to build an image that runs youtube-dl and does post-processing as described in uniquerockrz's and Jacob Tomlinson's answers at 
https://askubuntu.com/questions/178481/how-to-download-an-mp3-track-from-a-youtube-video

Installed using `pip` as described at http://rg3.github.io/youtube-dl/download.html because as mentioned [here](https://askubuntu.com/questions/178481/how-to-download-an-mp3-track-from-a-youtube-video#comment1426247_178483). `apt-get` installed versions give security/permissions errors.

Includes:

* Ubuntu 16.04-flavor Linux base
* [youtube-dl](https://rg3.github.io/youtube-dl/)
* ffmpeg for conversion to mp3

See [the Dockerfile](https://github.com/fomightez/youtubedl_docker/blob/master/Dockerfile) for additional info.

Use
----

For docker gurus:

    docker run -it fomightez/youtubedl
   
Step-by step to *EASILY* use:

Create a directory `/dls` (**ONLY IF YOU DON'T ALREADY HAVE ONE**) and use that to mount the volume at the time of starting the container.
That will make relaying the created files out of the container to the hose machine easier.  
And then run the following to fetch the image and start the container running with `/dls` mounted:

    docker run -v /dls:/dls -it fomightez/youtubedl
    
When the container is ready, run the following to update the version of the software easily:

    pip install -U youtube-dl
    
Then issue your commands such as:

    youtube-dl --extract-audio --audio-format mp3 --prefer-ffmpeg   <video URL>

I copy the file(s) to the mounted volume `/dls` to bring out of container to the host machine.
