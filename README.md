This is a simple command-line tool to encrypt and decrypt files using AES-GCM.

The key size is currently hardcoded to 256 bits.
IV size is 12 bytes.
Key and IV files are stored as raw bytes.

The tool uses the OpenSSL EVP API and is based on the `encrypt()` and `decrypt()` functions found at [Stack Overflow](https://stackoverflow.com/questions/9889492) and the [OpenSSL Wiki](https://wiki.openssl.org/index.php/EVP_Authenticated_Encryption_and_Decryption).

 * To build, type `make`
 * `./aesgcm -h` shows the usage text
 * `make test` runs a self-test (``make test V=1`` is more verbose)
