# ETF 2.0

This is an early upload of the ETF mod post 1.6 release with some experimental code added that was not part of any original release but was my testing purposes.

Notes:

* 64-bit is not supported (yet, code limitations need working around)
* macOS is not supported (never was)
* Some code is used from other trees like OpenJK q_math and such for convenience this may be replaced or reverted at some point.
* Compilation uses CMAKE, use mingw on windows to build for real. MSVC will probably produce incorrect results with movement.
* Some features I added are WIP and need removing
* Code is released under GPLv3 terms same as original ET per Splash Damage's request.

# Building ETF
## Windows
### Dependencies
#### MinGW
Download and install `mingw-get-setup.exe` from [MinGW home](www.mingw.org).

Once fully installed, and with the *MingGW Installation Manager* running, select the following packages for install:

1. `mingw-developer-toolkit-bin` (selecting this package will automatically select `msys-base-bin`)
2. `mingw32-base-bin`
3. `mingw32-gcc-g++-bin`

In the top menu, select _Installation_, _Apply Changes_, and then select _Apply_ in the dialog box that appears, titled _Schedule of Pending Actions_.  This will download and install the required MinGW utilities.

Add MinGW'to your `Path` Environment Variable. By default MinGW installs to `C:\MinGW`, so add `C:\MinGW\bin` to the `Path` environment variable.

#### CMake
Download and install the latest release of [CMake from cmake.org](https://cmake.org).  At the time of writing this is the _Windows win64-x64 Installer_: `cmake-3.19.2-win64-x64.msi`.

During the install I selected to add CMake to the system PATH for the current user.

#### ETF Source
Clone the ETF source code from [etfdevs/ETF](https://github.com/etfdevs/ETF) to your development machine.

### Building
* Run CMake, click _Browse Source..._, and navigate to the location where you cloned ETF to and select the _code_ folder.
* Click _Browse Build..._ and choose a folder where you'd like the output build files to be witten to.
* Click _Configure_
** Under _Specify the generator for this project_, select `MinGW Makefiles`
** Select _Use native compilers_
** Select _Finish_ to configure the build (LUA is missing but configure completes)
* Select _Generate_.

Launch `CMD.EXE` and enter the following:
```batch
cd <the build directory chosen after clicking 'Browse Build...' in CMake>
mingw32-make
```

Despite many warnings, this should compile the following DLLs in to your `build` folder:
* `cgame_mp_x86.dll`
* `qagame_mp_x86.dll`
* `ui_mp_x86.dll`
