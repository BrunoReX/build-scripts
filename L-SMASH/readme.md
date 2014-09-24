How to compile L-SMASH and L-SMASH Works with Visual Studio 2013
------------------------------------------

###Requirements:

-   Microsoft Visual Studio 2013 (Express was not tested, but should work)
-   [MSYS2](http://sourceforge.net/projects/msys2/files/Base/)

###Preparation:

-   Install Visual Studio 2013
-   Extract **MSYS2** somewhere (**C:\msys2** will refer to that location)
-   Go to **C:\msys2\usr\bin** and rename **link.exe** to **link.exe.bak** (this is important, otherwise it *will* conflict with MSVC's **link.exe**)
-   Create a "work directory" (**C:\work** will refer to that location)
-   Go to **C:\msys2** and double click **msys2_shell.bat**, wait for it to configure itself, close and open it again
-   Install the necessary packages by typing:
    -   For the x86 build:
        ```
pacman -Sy
pacman -S --needed make autoconf autogen diffutils git p7zip patch perl python2 ruby subversion yasm wget mingw-w64-i686-gcc mingw-w64-i686-gettext mingw-w64-i686-crt-git mingw-w64-i686-libtool mingw-w64-i686-libjpeg-turbo mingw-w64-i686-libpng mingw-w64-i686-libxml2 mingw-w64-i686-tools-git mingw-w64-i686-glib2 mingw-w64-i686-pkgconf mingw-w64-i686-cmake-git
        ```

    -   For the x64 build **(Optional)**:
        ```
pacman -Sy
pacman -S --needed mingw-w64-x86_64-gcc mingw-w64-x86_64-gettext mingw-w64-x86_64-crt-git mingw-w64-x86_64-libtool mingw-w64-x86_64-libjpeg-turbo mingw-w64-x86_64-libpng mingw-w64-x86_64-libxml2 mingw-w64-x86_64-tools-git mingw-w64-x86_64-glib2 mingw-w64-x86_64-pkgconf mingw-w64-x86_64-cmake-git
        ```

-   Type: ```cd "C:\work"```
-   For **ffmpeg** you have a few options:
    -  Check out the latest code by typing: ```git clone git://source.ffmpeg.org/ffmpeg.git```
    -  Download the [latest code](https://www.ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2)
    -  Download the [latest stable version](https://www.ffmpeg.org/download.html) (rename the folder to **ffmpeg** after extracting)
    
-   Get the latest **L-SMASH** code by typing: ```git clone https://github.com/l-smash/l-smash.git```
        
-   Get the latest **L-SMASH Works** code by typing: ```git clone https://github.com/VFR-maniac/L-SMASH-Works.git```
        
-   Close the **MSYS2** prompt

###Building L-SMASH:

1.  Building for x86:
    -   Go to **C:\msys2** and double click **mingw32_shell.bat**
    -   Type ```cd "c:\work\ffmpeg"```
    -   Type ```mkdir build32 && cd build32```
    -   Type ```../configure --prefix=/mingw32/local --extra-ldflags='-static' --target-os=mingw32 --arch=i686 --enable-avresample --disable-programs --disable-doc --disable-swresample --disable-encoders --disable-hwaccels --disable-filters --disable-debug```
    -   Type ```make && make install```
    -   Type ```cd "C:\work\l-smash"```
    -   Type ```mkdir build32 && cd build32```
    -   Type ```../configure --prefix=/mingw32/local --extra-ldflags='-static'```
    -   Type ```make && make install```
    -   Close the **MINGW32** prompt

2.  Building for x64 **(Optional)**:
    -   Go to **C:\msys2** and double click **mingw64_shell.bat**
    -   Type ```cd "c:\work\ffmpeg"```
    -   Type ```mkdir build64 && cd build64```
    -   Type ```../configure --prefix=/mingw64/local  --extra-ldflags='-static' --target-os=mingw32 --arch=x86_64 --enable-avresample --disable-programs --disable-doc --disable-swresample --disable-encoders --disable-hwaccels --disable-filters --disable-debug```
    -   Type ```make && make install```
    -   Type ```cd "C:\work\l-smash"```
    -   Type ```mkdir build64 && cd build64```
    -   Type ```../configure --prefix=/mingw64/local --extra-ldflags='-static'```
    -   Type ```make && make install```
    -   Close the **MINGW64** prompt

###Building L-SMASH Works (AviUtl & VapourSynth plugins):

1.  Building for x86:
    -   Go to **C:\msys2** and double click **mingw32_shell.bat**
    -   Type ```cd "c:\work\L-SMASH-Works\AviUtl"```
    -   Type ```mkdir build32```
    -   Type ```PKG_CONFIG_PATH=/mingw32/local/lib/pkgconfig ./configure --prefix=/mingw32/local --extra-ldflags='-static'```
    -   Type ```make```
    -   Type ```mv lwcolor.auc build32 && mv lwmuxer.auf build32 && mv lwdumper.auf build32 && mv lwinput.aui build32```
    -   Type ```make distclean```
    -   Type ```cd "c:\work\L-SMASH-Works\VapourSynth"```
    -   Type ```mkdir build32```
    -   Type ```PKG_CONFIG_PATH=/mingw32/local/lib/pkgconfig ./configure --prefix=/mingw32/local --extra-ldflags='-static'```
    -   Type ```make```
    -   Type ```mv vslsmashsource.dll build32```
    -   Type ```make distclean```
    -   Close the **MINGW32** prompt

2.  Building for x64 **(Optional)**:
    -   Go to **C:\msys2** and double click **mingw64_shell.bat**
    -   Type ```cd "c:\work\L-SMASH-Works\VapourSynth"```
    -   Type ```mkdir build64```
    -   Type ```PKG_CONFIG_PATH=/mingw64/local/lib/pkgconfig ./configure --prefix=/mingw64/local --extra-ldflags='-static'```
    -   Type ```make```
    -   Type ```mv vslsmashsource.dll build64```
    -   Type ```make distclean```
    -   Close the **MINGW64** prompt

###Building L-SMASH (for AviSynth plugin):

Unfortunately, I don't know how to solve some linking errors regarding the **ffmpeg** libraries built by mingw (or if they *can* be solved), so I'm taking the route that works, and compiling everything again.

1.  Building for x86:
    -   Open **Visual Studio 2013 -> Visual Studio Tools -> VS2013 x86 Native Tools Command Prompt**
    -   Type ```C:\msys2\mingw32_shell.bat```
    -   Type ```cd "c:\work\ffmpeg"```
    -   Type ```mkdir build32-msvc && cd build32-msvc```
    -   Type ```../configure --toolchain=msvc --prefix=/mingw32/local-msvc --enable-avresample --disable-programs --disable-doc --disable-swresample --disable-encoders --disable-hwaccels --disable-filters --disable-debug```
    -   Type ```make && make install```
    -   Type ```cd "C:\work\l-smash"```
    -   Type ```mkdir build32-msvc && cd build32-msvc```
    -   Type ```../configure --prefix=/mingw32/local-msvc --extra-ldflags='-static'```
    -   Type ```make && make install```
    -   Close the **MINGW32** prompt

2.  Building for x64 **(Optional)**:
    -   Open **Visual Studio 2013 -> Visual Studio Tools -> VS2013 x64 Native Tools Command Prompt**
    -   Type ```C:\msys2\mingw64_shell.bat```
    -   Type ```cd "c:\work\ffmpeg"```
    -   Type ```mkdir build64-msvc && cd build64-msvc```
    -   Type ```../configure --toolchain=msvc --prefix=/mingw64/local-msvc --enable-avresample --disable-programs --disable-doc --disable-swresample --disable-encoders --disable-hwaccels --disable-filters --disable-debug```
    -   Type ```make && make install```
    -   Type ```cd "C:\work\l-smash"```
    -   Type ```mkdir build64-msvc && cd build64-msvc```
    -   Type ```../configure --prefix=/mingw64/local-msvc --extra-ldflags='-static'```
    -   Type ```make && make install```
    -   Close the **MINGW64** prompt

###Building L-SMASH Works (AviSynth plugin):

-   Go to **C:\work\L-SMASH-Works\AviSynth** and open **LSMASHSourceVCX.sln** in Visual Studio
-   Building for x86:
    -   Change the configuration from **Debug** to **Release** and **Win32**
    -   Right-click the **LSMASHSource** and go to **Properties**
    -   Go to **VC++ Directories** and add the following to:
        -   Include Directories:

            ```
C:\msys2\mingw32\local-msvc\include
C:\msys2\mingw32\include
            ```

        -   Library Directories (**4.9.1** is the GCC version, you have to check which version you have):

            ```
C:\msys2\mingw32\local-msvc\lib
C:\msys2\mingw32\i686-w64-mingw32\lib
C:\msys2\mingw32\lib
C:\msys2\mingw32\lib\gcc\i686-w64-mingw32\4.9.1
            ```

-   Building for x64 **(Optional)**:
    -   Change the configuration from **Debug** to **Release** and **x64**
    -   Right-click the **LSMASHSource** and go to **Properties**
    -   Go to **VC++ Directories** and add the following to:
        -   Include Directories:

            ```
C:\msys2\mingw64\local-msvc\include
C:\msys2\mingw64\include
            ```

        -   Library Directories (**4.9.1** is the GCC version, you have to check which version you have):

            ```
C:\msys2\mingw64\local-msvc\lib
C:\msys2\mingw64\x86_64-w64-mingw32\lib
C:\msys2\mingw64\lib
C:\msys2\mingw64\lib\gcc\x86_64-w64-mingw32\4.9.1
            ```

-   Steps for **both** x86 and x64 **Release** configurations:
    -   Right-click the **LSMASHSource** and go to **Properties**
    -   Go to **C++ -> General** and change **Debug Information Format** to **None**
    -   Go to **Linker -> Input** and add the following to to **Additional Dependencies**:

        ```
liblzma.a
libiconv.a
ws2_32.lib
        ```

    -   Go to **Linker -> Input** and add ```libcmt.lib``` to **Ignore Specific Default Libraries**
    -   Go to **Linker -> Debugging** and change **Generate Debug Info** to **No**
    -   Go to **Linker -> Optimization** and change **References** to **No (/OPT:NOREF)**

-   **Compile!**

###Creating Packages:

-   Go to **C:\msys2** and double click **mingw32_shell.bat**
-   Type: ```cd "C:\work"```
-   Now download the bash script to create packages in one of two ways:
    -  Type: ```wget https://raw.githubusercontent.com/BrunoReX/build-scripts/master/L-SMASH/create_packages.sh```
    -  Or download download **create_packages.sh** manually and save it to **C:\work**
-   You may need to edit **create_packages.sh** to match your setup
-   Now type: ```./create_packages.sh``` and wait for it to finish
-   Go to **C:\work** and copy your newly created packages

###Sources:
-   [qyot27's post @ Doom9](http://forum.doom9.org/showthread.php?p=1620870#post1620870)
-   [ffmpeg documentation](https://www.ffmpeg.org/platform.html#Microsoft-Visual-C_002b_002b-or-Intel-C_002b_002b-Compiler-for-Windows)
-   [nak5124's build environment](https://github.com/nak5124/build_env)
