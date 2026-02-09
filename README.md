# SESS.DN42 homepage source

Here are source of [sess.dn42](https://sess.dn42/) homepage and some related things.

The site contains lots of service parts and you may view their source code via the link on pages. So this repo only provide homepage source code and contents, which is written by myself.

## Structure

### The `.rc` file

Most of the scripts use `.rc` file at the top of the repo. It is a POSIX Shell script in technical.

Here are some known environment variables should be exported in `.rc` file:
- `MUSIC_DIR`: Directory where music files are stored. Used in `cgi-src/radio-playlist.sh`, `radio/start.sh`

### Static HTML and CGI scripts

- Building dependencies: GNU Make, GNU coreutils
- Runtime dependencies: POSIX Shell (e.g. dash), GNU coreutils, GNU findutils

#### Building

```shell
make -j`nproc`
```

This will build all the CGI scripts and output a directory `cgi-bin` at top of the repo.

#### Running & Deploying

The static HTML files are at directory `html` and CGI scripts are at `cgi-bin`.
I recommended to symbolic link `cgi-bin` to `html/cgi-bin` for using Busybox httpd while developing.
If you are using Nginx & FastCGI for production, you should use the `cgi-bin` directory directly in the configuration file.

### Radio

- Dependencies: Icecast2, Liquidsoap, POSIX Shell (e.g. dash), GNU coreutils

#### Configuration

You should well configure the Icecase2 server and prepare the music files first.

Please define `icecast_host` `icecast_port` `icecast_password` `icecast_mount` of your Icecast2 server in the `radio/secret.liq`. And export `MUSIC_DIR` in `.rc` file.

#### Running

Just run: `radio/start.sh`. You may use Nginx to proxy the Icecast2 server, just like our site does.

## License

The information contents on the pages are licensed under CC-BY-NC-SA-4.0. And the source code to provide and display the content is licensed under GNU GPLv3.
