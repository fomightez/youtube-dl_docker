# youtube-dl_docker
Dockerfile to build an image that runs youtube-dl


Contents of built image
-----------------------

Dockerfile to build an image that runs youtube-dl and does post-processing as described in uniquerockrz's and Jacob Tomlinson's answers at 
https://askubuntu.com/questions/178481/how-to-download-an-mp3-track-from-a-youtube-video

Installed using `pip` as described at http://rg3.github.io/youtube-dl/download.html because as mentioned [here](https://askubuntu.com/questions/178481/how-to-download-an-mp3-track-from-a-youtube-video#comment1426247_178483). `apt-get` insalled versions give security/permissions errors.

Includes:

* Ubuntu 16.04-flavor Linux base
* [youtube-dl](https://rg3.github.io/youtube-dl/)
* ffmpeg for conversion to mp3

See [the Dockerfile](https://github.com/fomightez/youtubedl_docker/blob/master/Dockerfile) for additional info.

Use
----

    docker run -v /dls:/dls -it fomightez/youtubedl
   
Then issue your commands such as:

    youtube-dl --extract-audio --audio-format mp3 --prefer-ffmpeg   <video URL>

Or, if you want to make relaying the created files out of the container to the hose machine easier, create a directory `/dls` (**ONLY IF YOU DON'T ALREADY HAVE ONE**) and use that to mount the volume at the time of starting the container.

    docker run -v /dls:/dls -it fomightez/youtubedl

I copy the file(s) to the mounted volume `/dls` to bring out of container to the host machine.
