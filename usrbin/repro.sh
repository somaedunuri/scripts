cd /nobackup/soma && bash 
source /etc/profile.d/proxy.sh.back
/usr/bin/python3.6 -mvenv xr-rpb --system-site-packages 
source xr-rpb/bin/activate
pip install diffoscope
PATH=$PATH:/nobackup/soma/xr-rpb/bin/
