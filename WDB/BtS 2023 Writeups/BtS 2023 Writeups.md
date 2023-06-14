# Doner challenge

Do you like kebab? I do, but it's hard to find a good one, could you help me?

CTF: [Break The Syntax 2023](https://ctftime.org/event/1940/)
Team: [✨🌟💖💎🦄💎💖🌟✨🌟💖💎🦄💎💖🌟✨](https://ctftime.org/team/231415)
Kategoria: `forensics`
Flaga: `BtSCTF{B3$T_K3848_3V3R}`

Pliki do zadania: [image.jpg](./image.jpg)

Narzędzia wykorzystane do rozwiązania zadania:
* [binwalk](https://github.com/ReFirmLabs/binwalk)
* [John the Ripper](https://github.com/openwall/john)
* [exiftool](https://exiftool.org/)

Korzystając z polecenia `binwalk image.jpg`, dowiadujemy się, że plik `image.jpg` zawiera zaszyfrowany plik ZIP, który zawiera plik `tortilla.jpg`.

Output:
```
DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
17979         0x463B          Zip archive data, encrypted at least v2.0 to extract, compressed size: 70812, uncompressed size: 73631, name: tortilla.jpg
88959         0x15B7F         End of Zip archive, footer length: 22
```

Za pomocą polecenia `binwalk -e image.jpg` wyciągamy plik ZIP z obrazka.

To polecenie stworzy nam w obecnym katalogu folder o nazwie `_NAZWA_PLIKU_Z_KTOREGO_EKSTRAKTUJEMY.extracted`, czyli w naszym przypadku `_image.jpg.extracted`

```bash
cd _image.jpg.extracted

zip2john *.zip > hash
john hash
```

Uzyskujemy hasło do zaszyfrowanego pliku: `iloveyou`

```bash
unzip *.zip
```

```bash
exiftool tortilla.jpg
```

Output:
```
ExifTool Version Number         : 12.62
File Name                       : tortilla.jpg
Directory                       : /home/jan/Downloads
File Size                       : 73 kB
File Modification Date/Time     : 2023:06:02 20:02:08+02:00
File Access Date/Time           : 2023:06:13 19:50:33+02:00
File Inode Change Date/Time     : 2023:06:02 20:02:08+02:00
File Permissions                : -rw-rw-r--
File Type                       : JPEG
File Type Extension             : jpg
MIME Type                       : image/jpeg
Exif Byte Order                 : Big-endian (Motorola, MM)
XMP Toolkit                     : Image::ExifTool 12.57
GPS Longtitude                  : 17 deg 3' 18.88" E
Image Width                     : 600
Image Height                    : 420
Encoding Process                : Baseline DCT, Huffman coding
Bits Per Sample                 : 8
Color Components                : 3
Y Cb Cr Sub Sampling            : YCbCr4:2:0 (2 2)
Image Size                      : 600x420
Megapixels                      : 0.252
```

Można uzyskać współrzędne GPS w bardziej standardowej postaci. Fragmenty dokumentacji uzyskanej poleceniem `man exiftool`, są poniżej:

```
-c FMT      (-coordFormat)       Set format for GPS coordinates
```

```
-c FMT (-coordFormat)
            Set the print format for GPS coordinates.  FMT uses the same syntax as a "printf" format string.  The specifiers correspond to degrees, minutes and seconds in that order,
            but minutes and seconds are optional.  For example, the following table gives the output for the same coordinate using various formats:

                        FMT                  Output
                -------------------    ------------------
                "%d deg %d' %.2f"\"    54 deg 59' 22.80"  (default for reading)
                "%d %d %.8f"           54 59 22.80000000  (default for copying)
                "%d deg %.4f min"      54 deg 59.3800 min
                "%.6f degrees"         54.989667 degrees

            Notes:

            1) To avoid loss of precision, the default coordinate format is different when copying tags using the -tagsFromFile option.

            2) If the hemisphere is known, a reference direction (N, S, E or W) is appended to each printed coordinate, but adding a "+" to the format specifier (eg. "%+.6f") prints a
            signed coordinate instead.

            3) This print formatting may be disabled with the -n option to extract coordinates as signed decimal degrees.
```

```bash
exiftool -c "%6f" tortilla.jpg
```

Output:
```
ExifTool Version Number         : 12.62
File Name                       : tortilla.jpg
Directory                       : .
File Size                       : 73 kB
File Modification Date/Time     : 2023:06:02 20:02:08+02:00
File Access Date/Time           : 2023:06:13 19:50:33+02:00
File Inode Change Date/Time     : 2023:06:02 20:02:08+02:00
File Permissions                : -rw-rw-r--
File Type                       : JPEG
File Type Extension             : jpg
MIME Type                       : image/jpeg
Exif Byte Order                 : Big-endian (Motorola, MM)
XMP Toolkit                     : Image::ExifTool 12.57
GPS Longtitude                  : 17.055244 E
Image Width                     : 600
Image Height                    : 420
Encoding Process                : Baseline DCT, Huffman coding
Bits Per Sample                 : 8
Color Components                : 3
Y Cb Cr Sub Sampling            : YCbCr4:2:0 (2 2)
Image Size                      : 600x420
Megapixels                      : 0.252
```

Mamy południk $17.055244 \text{ E}$. Używając Google Maps, próbujemy znaleźć odpowiedni równoleżnik, żeby ustalić konkretne miejsce na mapie.

Możemy po kolei wnioskować, że szukane miejsce może być w Polsce, następnie, że może być we Wrocławiu, w pobliżu PWr... Korzystając z nazwy zadania i obrazku tortilli, możemy dojść do wniosku, że chodzi o `Habibi Doner`, które mieści się na naszym południku.

![](GPS%20Coordinates.png)

Następnie patrząc na najnowsze opinie Google, zdobywamy flagę `BtSCTF{B3$T_K3848_3V3R}`

![](Google%20Review.png)
