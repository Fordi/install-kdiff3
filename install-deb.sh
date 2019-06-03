
#!/bin/bash
sudo apt install kdiff3
git config --global merge.tool kdiff3
git config --global mergetool.kdiff3.path "$(which kdiff3)"
