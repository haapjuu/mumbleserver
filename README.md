# qwerty
**Assignment H5:** http://terokarvinen.com/2018/aikataulu-%E2%80%93-palvelinten-hallinta-ict4tn022-4-ti-5-ke-5-loppukevat-2018-5p


For this little assignment the idea was to make a salt state that installs and configures a Mumble server and the necessary firewall port for the slave machine.


### **Instructions**

1. Use the command in terminal to get the bash script from this repository.
```
wget https://raw.githubusercontent.com/haapjuu/qwerty/master/run.sh
```

2. Run the bash script.
```
bash run.sh
```


### **Tehtävässä käytetyt laittet**

&nbsp;&nbsp;&nbsp;&nbsp;HP ProBook 655 G2 (Xubuntu 16.04 LTS x64)<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Virtuaalipalvelin Digital Oceanilta (Xubuntu 16.04 LTS x64)
<br/>
<br/>

<br/>

Mumble palvelimen asennus itsessään oli yllättävän nopeaa ja helppoa. Suurimmat haasteet tehtävässä tulivat Githubin käyttämisen ja valmiin salt staten ajamiseen tarvittavan automaation opettelemisessa.
<br/>
Ensimmäiseksi ajettava "_run.sh_" skripti asentaa laitteelle Gitin ja salt-minionin. Seuraavaksi laitteelle kloonautuu Github repositoryni _"qwerty"_ joka sisältää loput komentojen suorittamisessa tarvittavat tiedostot. Ajettavasta koneesta tehdään itsensä mestari saltissa komennolla
```
echo 'master: localhost'|sudo tee /etc/salt/minion
```
Github repon cloonauksen jälkeen scripti bashaa kyseisen repon mukana tulleen "_highstate.sh_" skriptin, joka ajaa itse lopullisen salt staten komennolla
```
sudo salt-call --local --file-root srv/salt/ --pillar-root srv/pillar/  state.apply mumble
```
Itse salt state vielä tässä
```
mumble-server:
  pkg.installed

mumble:
  pkg.installed

/etc/mumble-server.ini:
  file.managed:
    - source: salt://mumble/mumble-server.ini

ufw-enable-mumble-port:
  cmd.run:
    - name: 'sudo ufw allow 64738/tcp'

ufw-enable:
  cmd.run:
    - name: 'sudo ufw enable'

restart-ufw:
  cmd.run:
    - name: 'sudo systemctl restart ufw.service'

restart-mumble-server:
  cmd.run:
    - name: 'sudo systemctl restart mumble-server.service'
```
Tila asentaa Mumble-server ja client paketit laitteelle muuntaen samalla mumble-serverin käyttämää mumble-server.ini asetustiedostoa hieman. Mumble palvelimelle avataan myös sen tarvitsema oletusportti 64738. Viimeiseksi tila kytkee vielä palomuurin päälle ja uudelleenkäynnistää palvelut, jotta niiden uudet asetukset tulevat varmasti voimaan.
<br/>
<br/>
Vielä lopuksi ajetaan muutamia asetuksia järjestelmään ja Githubiin
```
setxkbmap fi
```
Vaihtaa näppäimistön layoutin suomenkieliseksi
<br/>
<br/>
```
sudo timedatectl set-timezone Europe/Helsinki
```
```
git config --global credential.helper "cache --timeout=3600"
```
Githubin kirjautumistietojen kyselytiheyttä pienennetään
<br/>
<br/>
```
git config --global push.default simple
```
Muutetaan "git push" komennon logiikkaa yksinkertaisemmaksi
<br/>
<br/>
```
git config --global user.email "email"
git config --global user.name "username"
```
<br/>
<br/>




**Lähteet:**

&nbsp;&nbsp;&nbsp;&nbsp;https://github.com/terokarvinen/sirotin<br/>
&nbsp;&nbsp;&nbsp;&nbsp;https://docs.saltstack.com/en/latest/topics/tutorials/quickstart.html<br/>
&nbsp;&nbsp;&nbsp;&nbsp;https://github.com/saltstack/salt/blob/develop/doc/topics/tutorials/starting_states.rst<br/>
