# Install coc-java
* Resolves the server not found error
```
  :CocInstall coc-java
  :CocCommand java.updateLanguageServer --> fetch new jdt
  
  archlinux-java status --> if openjdk 8 then:
    sudo pacman -S jdk-openjdk
    archlinux-status
    sudo archlinux-java set java-15-openjdk --> switch to whatever version that was installed

  :CocReset
```
[link](https://www.reddit.com/r/neovim/comments/hwosq7/cocjava_the_java_server_crashed_5_times_in_the/)

