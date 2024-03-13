# You can simple do it in your host machine follow the steps from 10 to 23
# or if you want to test on the virtual machine you can follow the steps from 1 to 23

1. sudo apt install vagrant
2. sudo apt install virtualbox
3. mkdir boxes
4. cd boxes
5. mkdir deveai
6. cd deveai
7. git clone https://github.com/HarisAfzal7/echelon_scripts_updated.git

8. vagrant up
# A window of ubuntu will be open with a user of vagrant enter the password "vagrant"
9. password: vagrant
   
#open a terminal inside the new vitrual machine(ubuntu)

10. cd ~/.ssh/
11. ssh-keygen
12. press enter 3 to 4 times untile the next command line is appear

13. cat id_rsa.pub
14. copy the complete test printing by "cat id_rsa.pub" command
15. go to https://github.com/settings/keys this url
16. click on the button "New SSH key"

17. add a title
18. paste the copy text(key) in the key input text area
19. click on the "Add SSH key" button

20. go to terminal again
21. execute "ssh -T git@github.com" command
22. type "yes" and enter

#now

22. cd /code
23. ./run2.sh





