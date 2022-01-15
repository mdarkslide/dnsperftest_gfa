# DNS Performance Test
## DNSPERFTEST_GFA
## Coordinación de Infraestructura y Bases de Datos
### Ing. Miguel Olmos Mares

![Logo de Primera Plus](https://wl.primeraplus.com.mx/assets/gfa/logo-dec-c9dfa7280cdc440132b9c3e92623e020bcfc7bc335f3ef56aa8e9ed1f661ead1.png)
>
[![Generic badge](https://img.shields.io/badge/Materia-Modelos%20de%20Arquitectura-lightgrey)](https://shields.io/)
[![Generic badge](https://img.shields.io/badge/version-1.0-blue)](https://shields.io/) 
![GitHub last commit](https://img.shields.io/github/last-commit/mdarkslide/dnsperftest_gfa)


## Introducción
> Shell script to test the performance of the most popular DNS resolvers from your location.

Includes by default:
 * CloudFlare 1.1.1.1
 * Google DNS 8.8.4.4
 * Quad9 9.9.9.9
 * Level3 209.244.0.3
 * Open DNS 208.67.222.222
 * Comodo Secure DNS 8.26.56.26
 * CleanBrowsing 185.228.168.168
 * Norton DNS 199.85.126.20
 * Yandex 77.88.8.7
 * Frenoom DNS 80.80.80.80
 * AdGuard DNS 176.103.130.130


# Required 

You need to install bc and dig for Ubuntu:

```
 $ sudo apt-get install bc dnsutils
```

# Utilization

``` 
 $ git clone --depth=1 https://github.com/mdarkslide/dnsperftest_gfa.git
 $ cd dnsperftest
 $ bash ./dnstest.sh 
               test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average 
cloudflare     1 ms    1 ms    1 ms    2 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms      1.10
google         22 ms   1 ms    4 ms    24 ms   1 ms    19 ms   3 ms    56 ms   21 ms   21 ms     17.20
quad9          10 ms   19 ms   10 ms   10 ms   10 ms   10 ms   10 ms   10 ms   10 ms   55 ms     15.40
opendns        39 ms   2 ms    2 ms    20 ms   2 ms    72 ms   2 ms    39 ms   39 ms   3 ms      22.00
norton         2 ms    2 ms    2 ms    2 ms    1 ms    2 ms    2 ms    1 ms    2 ms    2 ms      1.80
cleanbrowsing  11 ms   14 ms   11 ms   11 ms   10 ms   10 ms   11 ms   36 ms   11 ms   13 ms     13.80
yandex         175 ms  209 ms  175 ms  181 ms  188 ms  179 ms  178 ms  179 ms  177 ms  208 ms    184.90
adguard        200 ms  200 ms  200 ms  199 ms  202 ms  200 ms  202 ms  200 ms  199 ms  248 ms    205.00
neustar        2 ms    2 ms    2 ms    2 ms    1 ms    2 ms    2 ms    2 ms    2 ms    2 ms      1.90
comodo         21 ms   22 ms   22 ms   22 ms   22 ms   22 ms   22 ms   21 ms   22 ms   24 ms     22.00
```

To sort with the fastest first, add `sort -k 22 -n` at the end of the command:

```
  $ bash ./dnstest.sh |sort -k 22 -n
               test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average 
cloudflare     1 ms    1 ms    1 ms    4 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms      1.30
norton         2 ms    2 ms    2 ms    2 ms    2 ms    2 ms    2 ms    2 ms    2 ms    2 ms      2.00
neustar        2 ms    2 ms    2 ms    2 ms    1 ms    2 ms    2 ms    2 ms    2 ms    22 ms     3.90
cleanbrowsing  11 ms   23 ms   11 ms   11 ms   11 ms   11 ms   11 ms   13 ms   12 ms   11 ms     12.50
google         4 ms    4 ms    3 ms    21 ms   21 ms   61 ms   3 ms    21 ms   21 ms   22 ms     18.10
opendns        2 ms    2 ms    2 ms    39 ms   2 ms    75 ms   2 ms    21 ms   39 ms   13 ms     19.70
comodo         22 ms   23 ms   22 ms   22 ms   22 ms   22 ms   22 ms   22 ms   22 ms   23 ms     22.20
quad9          10 ms   37 ms   10 ms   10 ms   10 ms   145 ms  10 ms   10 ms   10 ms   20 ms     27.20
yandex         177 ms  216 ms  178 ms  182 ms  186 ms  177 ms  183 ms  174 ms  186 ms  222 ms    188.10
adguard        199 ms  210 ms  200 ms  201 ms  202 ms  202 ms  199 ms  200 ms  198 ms  201 ms    201.20
```

# For Windows users using the Linux subsystem

If you receive an error `$'\r': command not found`, convert the file to a Linux-compatible line endings using:

    tr -d '\15\32' < dnstest.sh > dnstest-2.sh
    
Then run `bash ./dnstest-2.sh`

## Recursos
> Los detalles de este proyecto se describen en el siguiente articulo: [GitHub DNS Performance Test](https://github.com/cleanbrowsing/dnsperftest/)
## Agradecimientos
Gracias a todo el equipo de la Maestría en Tecnologías de la Información Empresarial, ¡Sin ustedes esto no habría sido posible!
## Fin del documento.