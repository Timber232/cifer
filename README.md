# Cifer - Wrapper Shell for GPG

No, I didn't mispell Cipher.
This is a custom shell script to encrypt/decrypt multiple folders using GPG. 

## Flags

- **-E**: Encrypt mode
- **-D**: Decrypt mode
- **-u**: Takes the user id parameter. This flag is required
- **-p**: Takes the target directory parameter. This flag is required
- **-t**: Takes the archive method parameter (accepts: `gz`|`bz2`). Default is `gz`
- **-a**: Performs action (encrypt|decrypt) on all contents within the target directory
- **-d**: Destructive. Destroys original files after encryption or decryption
- **-i**: Ignore if exists, don't replace existing files.

## Usage

###  Encrypt

Tar then encrypt all directories within the target folder:

```
cifer -E -u [uid] -p [file_path] -a
```

Tar then encrypt target directory:

```
cifer -E -u [uid] -p [file_path] 
```

### Decrypt

Decrypt then untar all directories with the chosen folder:

```
cifer -D -u [uid] -p [file_path] -a
```

Decrypt then untar target directory:

```
cifer -D -u [uid] -p [file_path]
```

## Examples

**Example flag usage for encryp mode (`-E`)**

Encrypt a single folder
```
cifer -E -u [uid] -p [file_path]
```

Encrypt all content within the target folder
```
cifer -E -a -u [uid] -p [file_path]
```

Encrypt folder or folders with a specific archive method (gz or bz2)
```
cifer -E -u [uid] -p [file_path] -t [[gz|bz2]]
```

Encrypt folder with destructive flag, this will destroy the original file and replace it with the encrypted file.
```
cifer -E -d -u [uid] -p [file_path]
```

Ignore existing files and encrypt only new folders
```
cifer -E -i -u [uid] -p [file_path]
cifer -E -i -a -u [uid] -p [file_path]
```
